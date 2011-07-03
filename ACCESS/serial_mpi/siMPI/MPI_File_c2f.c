/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_File_c2f.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************    MPI_File_c2f.c        ************************/
/****************************************************************************/
/* Author : Lisa Alano July 22 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

/* STUB */
MPI_Fint MPI_File_c2f(MPI_File fh)
{
  _MPI_COVERAGE();
  return PMPI_File_c2f(fh); 
}

