/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Wtime.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/**************************************************************************/
/* FILE   **************        MPI_Wtime.c        ************************/
/**************************************************************************/
/* Author: Patrick Miller March  5 2004                                   */
/* Copyright (C) 2004 University of California Regents                    */
/**************************************************************************/
/* Simple "high resolution timer                                          */
/**************************************************************************/

#include "mpi.h"

double MPI_Wtime(void)
{
  _MPI_COVERAGE();
  return PMPI_Wtime();
}
