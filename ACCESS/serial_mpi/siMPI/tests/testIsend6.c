
/*TEST
PATH='tests/testIsend6.c'
CCFLAGS=""
INPUT=""
OUTPUT='Isend = 0\nHello there\nIrecv = 0\n'
STATUS=0
TEST*/

/******************************************************************/
/* FILE  ***********      testIsend6.c         ********************/
/******************************************************************/
/* Author : Lisa Alano July 29 2002                               */
/* Copyright (c) 2002 University of California Regents            */
/******************************************************************/
/******************************************************************/

#if 0
CCFLAGS = None 
ARGS = None
INPUT = EOF 
OUTPUT = Isend = 5000
  Hello there
  Irecv = 5000
STATUS = 0 
#endif

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "mpi.h"

int main(int argc, char**argv) 
{
  int my_rank;
  int p;
  char message1[50];
  char message2[50];
  int source, dest, tag, retval; 
  MPI_Request request;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &p);

  source = tag = dest = 0;
  sprintf(message1, "Hello there");
  retval = MPI_Isend(message1, strlen(message1)+1, MPI_CHAR, dest, tag, MPI_COMM_WORLD, &request);
  printf("Isend = %d\n", retval);
  retval = MPI_Irecv(message2, 50, MPI_CHAR, source, tag, MPI_COMM_WORLD, &request);
  printf("%s\n", message2);
  printf("Irecv = %d\n", retval);

  MPI_Finalize();
  return 0;
}
