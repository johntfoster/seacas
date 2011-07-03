/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Cart_rank.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:39 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************      MPI_Cart_rank.c     ************************/
/****************************************************************************/
/* Author : Lisa Alano July 18 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

/* STUB */
int MPI_Cart_rank (
        MPI_Comm comm,
        int *coords,
        int *rank )
{
  _MPI_COVERAGE();
  return PMPI_Cart_rank(comm, coords, rank); 
}

