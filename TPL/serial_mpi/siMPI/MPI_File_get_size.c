/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_File_get_size.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2006/08/10 22:26:03 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************   MPI_File_get_size.c     ***********************/
/****************************************************************************/
/* Author : Lisa Alano July 22 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

/* STUB */
int MPI_File_get_size(MPI_File fh, MPI_Offset *size)
{
  _MPI_COVERAGE();
  return PMPI_File_get_size(fh, size); 
}

