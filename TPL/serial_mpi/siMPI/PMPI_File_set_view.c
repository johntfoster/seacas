/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: PMPI_File_set_view.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2006/08/10 22:26:03 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  ******************  PMPI_File_set_view.c    ************************/
/****************************************************************************/
/* Author : Lisa Alano July 22 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

/* STUB */
int PMPI_File_set_view(MPI_File fh, MPI_Offset disp, MPI_Datatype etype,
                MPI_Datatype filetype, char *datarep, MPI_Info info)
{
  fprintf(stderr,"%s:%d: NOT IMPLEMENTED\n",__FILE__,__LINE__);
  return MPI_Abort((MPI_Comm)NULL, MPI_UNDEFINED); 
}

