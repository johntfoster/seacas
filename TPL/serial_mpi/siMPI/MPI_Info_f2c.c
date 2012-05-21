/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: MPI_Info_f2c.c,v $
 *    $Author: gdsjaar $
 *    $Date: 2006/08/10 22:26:03 $
 *    $Revision: 1.1 $
 ****************************************************************************/
/****************************************************************************/
/* FILE  **********************    MPI_Info_f2c.c    ************************/
/****************************************************************************/
/* Author : Lisa Alano July 23 2002                                         */
/* Copyright (c) 2002 University of California Regents                      */
/****************************************************************************/

#include "mpi.h"

MPI_Info MPI_Info_f2c(MPI_Fint info)
{
  _MPI_COVERAGE();
  return PMPI_Info_f2c (info);
}
