/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_File_set_size.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************   MPI_File_set_size.c    ************************/
/****************************************************************************/
/* Author : Lisa Alano July 22 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

int MPI_File_set_size(MPI_File fh, MPI_Offset size)
{
  _MPI_COVERAGE();
  return PMPI_File_set_size (fh, size); 
}

