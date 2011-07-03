/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Ibsend.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:50:40 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/***********************************************************************************************/
/* FILE  **************************      MPI_Ibsend.c         *********************************/
/***********************************************************************************************/
/* Author : Lisa Alano July 16 2002                                                            */
/* Copyright (c) 2002 University of California Regents                                         */
/***********************************************************************************************/

#include "mpi.h"

/*=============================================================================================*/
int MPI_Ibsend (void* message, int count, MPI_Datatype datatype, int dest,
        int tag, MPI_Comm comm, MPI_Request* request)
{
  _MPI_COVERAGE();
  return PMPI_Ibsend(message, count, datatype, dest, tag, comm, request);
}
/*=============================================================================================*/

