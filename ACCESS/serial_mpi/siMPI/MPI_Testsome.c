/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Testsome.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  *********************  MPI_Testsome.c  *****************************/
/****************************************************************************/
/* Author : Lisa Alano July 23 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

int MPI_Testsome( 
        int incount, 
        MPI_Request array_of_requests[], 
        int *outcount, 
        int array_of_indices[], 
        MPI_Status array_of_statuses[] )
{
  _MPI_COVERAGE();
  return PMPI_Testsome (incount, array_of_requests, outcount, array_of_indices, array_of_statuses);
}
