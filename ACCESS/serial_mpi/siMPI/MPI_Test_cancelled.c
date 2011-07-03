/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Test_cancelled.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************   MPI_Test_cancelled.c   ************************/
/****************************************************************************/
/* Author : Lisa Alano July 23 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

int MPI_Test_cancelled(MPI_Status *status, int *flag) {
  _MPI_COVERAGE();
  return PMPI_Test_cancelled(status, flag);
}

