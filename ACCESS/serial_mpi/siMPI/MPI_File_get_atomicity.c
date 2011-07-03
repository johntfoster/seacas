/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_File_get_atomicity.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************   MPI_File_get_atomicity.c  *********************/
/****************************************************************************/
/* Author : Lisa Alano July 22 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

/* STUB */
int MPI_File_get_atomicity(MPI_File fh, int *flag)
{
  _MPI_COVERAGE();
  return PMPI_File_get_atomicity(fh, flag); 
}
