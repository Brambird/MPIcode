#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <mpi.h>

static inline int64_t
time_elapsed (struct timespec a, struct timespec b)
{
    return ((int64_t)a.tv_sec - b.tv_sec) * 1000000
            + ((int64_t)a.tv_nsec - b.tv_nsec) / 1000LL;
}
static inline struct timespec
time_gettime ()
{
    struct timespec s;
    clock_gettime(CLOCK_REALTIME, &s);
    return s;
}
static inline void
time_print_elapsed (const char *id, struct timespec start, struct timespec finish)
{
    (void) fprintf (stdout, "--- [%s] time elapsed %03li ms\n", id,
                    time_elapsed (finish, start)/1000);
}

//
// allocate a a flattened matrix of "nxn" elements
//
double *allocMatrix( size_t n)
{
   double *m;
   m = (double *)malloc( n*n*sizeof(double));
   if( m==NULL) {
      perror( "failed to allocate matrix; ");
   }
   return m;
}

//
// initialise the values of the given matrix "out" of size "nxn" with 0s
//
void init( double *out, size_t n)
{
   size_t i,j;

   for( i=0; i<n; i++) {
      for( j=0; j<n; j++) {
         out[i*n+j] = 0;
      }
   }

}

//
// print the values of a given matrix "out" of size "nxn"
//
void print( double *out, size_t n)
{
   size_t i,j,maxn;

   maxn = (n < 20 ? n : 20);
   for( i=0; i<maxn; i++) {
      printf( "|");
      for( j=0; j<maxn; j++) {
         printf( " %7.2f", out[i*n+j]);
      }
      if( maxn < n) {
         printf( "...|\n");
      } else {
         printf( "|\n");
      }
   }
   if( maxn < n) {
         printf( "...\n");
      }
}

//
// individual step of the 5-point stencil
// computes values in matrix "out" from those in matrix "in"
// assuming both are of size "nxn"
//
void relax( double *in, double *out, size_t n, int rank, int npp, int processes)
{
	size_t i,j;
	int row_start = ((rank*npp) - (rank*npp%n)) / n;
	int row_finish = (((rank+1)*npp) + (rank*npp%n)) / n;
	if (rank == 0 && rank != processes-1) {
		for( i=1; i<row_finish; i++) {
			for( j=1; j<n-1; j++) {
			    out[i*n+j] = 0.25*in[(i-1)*n+j]      // upper neighbour
			                + 0.25*in[i*n+j]        // center
			                + 0.125*in[(i+1)*n+j]   // lower neighbour
			                + 0.175*in[i*n+(j-1)]   // left neighbour
			                + 0.2*in[i*n+(j+1)];    // right neighbour
			}
		}
	} else if (rank != processes-1) {
		for( i=row_start; i<row_finish; i++) {
			for( j=1; j<n-1; j++) {
			    out[i*n+j] = 0.25*in[(i-1)*n+j]      // upper neighbour
			                + 0.25*in[i*n+j]        // center
			                + 0.125*in[(i+1)*n+j]   // lower neighbour
			                + 0.175*in[i*n+(j-1)]   // left neighbour
			                + 0.2*in[i*n+(j+1)];    // right neighbour
			}
		}
	} else if (rank == 0 &&  rank == processes-1) {
		for( i=1; i<row_finish-1; i++) {
			for( j=1; j<n-1; j++) {
			    out[i*n+j] = 0.25*in[(i-1)*n+j]      // upper neighbour
			                + 0.25*in[i*n+j]        // center
			                + 0.125*in[(i+1)*n+j]   // lower neighbour
			                + 0.175*in[i*n+(j-1)]   // left neighbour
			                + 0.2*in[i*n+(j+1)];    // right neighbour
			}
		}
	} 
	else {
		for( i=row_start; i<row_finish-1; i++) {
			for( j=1; j<n-1; j++) {
			    out[i*n+j] = 0.25*in[(i-1)*n+j]      // upper neighbour
			                + 0.25*in[i*n+j]        // center
			                + 0.125*in[(i+1)*n+j]   // lower neighbour
			                + 0.175*in[i*n+(j-1)]   // left neighbour
			                + 0.2*in[i*n+(j+1)];    // right neighbour
			}
		}
	}
}

int main (int argc, char *argv[])
{
   struct timespec start;
   struct timespec finish;

   double *a,*b, *tmp;
   size_t n=0;
   int i;
   int max_iter;
   int my_rank, processes;

   if( argc < 3) {
      printf("call should have two arguments \"%s <n> <iter>\"\n", argv[0]);
      exit(1);
   }
   if( sscanf( argv[1], "%zu", &n) != 1) {
      printf("non size_t value for matrix size\n");
      exit(1);
   }
  
   if( sscanf( argv[2], "%d", &max_iter) != 1) {
      printf("non int value for # iterations\n");
      exit(1);
   }
   MPI_Init(&argc, &argv);

   MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
   MPI_Comm_size(MPI_COMM_WORLD, &processes);

   a = allocMatrix( n);
   b = allocMatrix( n);

   init( a, n);
   init( b, n);

   a[n/4] = 100.0;;
   b[n/4] = 100.0;;

   a[(n*3)/4] = 1000.0;;
   b[(n*3)/4] = 1000.0;;

   int n_per_p = n*n/processes;
   if (my_rank==0) {
   	   /*printf( "size   : n = %zu => %d M elements (%d MB)\n",
           	n, (int)(n*n/1000000), (int)(n*n*sizeof(double) / (1024*1024)));
	   printf( "iter   : %d\n", max_iter);*/
	   printf("running with %d ranks\n", processes);

   	//print(a, n);
   }
   start = time_gettime ();

   for( i=0; i<max_iter; i++) {
      tmp = a;
      a = b;
      b = tmp;
      relax( a, b, n, my_rank, n_per_p, processes);
      MPI_Allgather(b+(my_rank*n_per_p), n_per_p, MPI_FLOAT, b, n_per_p, MPI_FLOAT, MPI_COMM_WORLD);

   }
   
   finish = time_gettime ();
   if (my_rank==0) {
   	//printf( "Matrix after %d iterations:\n", i);
   	//print( b, n);

   	const char *id = "Total time: ";
   	time_print_elapsed (id, start, finish);

   	float time = (float)time_elapsed(start,finish)/-1000000;
   	float flops = max_iter * ((n-2)*(n-2)) * 9;
   	float gflops = flops/time/1000000000;
   	printf("time: %f\n",time);
   	printf("GFLOP/s: %f\n", gflops);
   }
   MPI_Finalize();

   return 0;
}
