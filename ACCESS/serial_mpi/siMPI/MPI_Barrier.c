/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Barrier.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:39 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************      MPI_Barrier.c       ************************/
/****************************************************************************/
/* Author : Lisa Alano July 18 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

/* STUB */
int MPI_Barrier ( MPI_Comm comm)
{
  _MPI_COVERAGE();
  return PMPI_Barrier (comm); 
}

