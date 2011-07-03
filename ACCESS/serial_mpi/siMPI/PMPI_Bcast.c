/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: PMPI_Bcast.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************       PMPI_Bcast.c       ************************/
/****************************************************************************/
/* Author : Lisa Alano July 1 2002                                          */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mpi.h"

/*==========================================================================*/
int PMPI_Bcast ( void *buffer, int count, MPI_Datatype datatype, int root, 
  MPI_Comm comm )
{
  int retval;
  _MPI_COVERAGE();
  _MPI_CHECK_STATUS(&comm);

  retval =  _MPI_checks (buffer, count, datatype, root, 1, comm);
  if (retval != MPI_SUCCESS)
  {
  _MPI_COVERAGE();
    _MPI_ERR_ROUTINE(retval, "MPI_BCAST: Argument error.");
    MPI_Abort (comm, retval);  
  }
  return retval;
}
/*==========================================================================*/

