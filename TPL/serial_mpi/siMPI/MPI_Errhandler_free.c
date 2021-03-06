/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Errhandler_free.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2006/08/10 22:26:03 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************  MPI_Errhandler_free.c   ************************/
/****************************************************************************/
/* Author : Lisa Alano July 24 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

int MPI_Errhandler_free( MPI_Errhandler *errhandler )
{
  _MPI_COVERAGE();
  return PMPI_Errhandler_free (errhandler);
}

