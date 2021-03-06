/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Topo_test.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2006/08/10 22:26:03 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ************************  MPI_Topo_test.c   ************************/
/****************************************************************************/
/* Author : Lisa Alano July 23 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

int MPI_Topo_test ( MPI_Comm comm, int *top_type )
{
  _MPI_COVERAGE();
  return PMPI_Topo_test (comm, top_type);
}

