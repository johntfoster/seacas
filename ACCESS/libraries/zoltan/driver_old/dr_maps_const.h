/*****************************************************************************
 * Zoltan Library for Parallel Applications                                  *
 * Copyright (c) 2000,2001,2002, Sandia National Laboratories.               *
 * For more info, see the README file in the top-level Zoltan directory.     *  
 *****************************************************************************/
/*****************************************************************************
 * CVS File Information :
 *    $RCSfile: dr_maps_const.h,v $
 *    $Author: gdsjaar $
 *    $Date: 2009/06/09 18:37:57 $
 *    Revision: 1.3 $
 ****************************************************************************/


#ifndef _DR_MAPS_CONST_H
#define _DR_MAPS_CONST_H

#ifdef __cplusplus
/* if C++, define the rest of this header file as extern C */
extern "C" {
#endif


#include "dr_const.h"

extern int build_elem_comm_maps(int, MESH_INFO_PTR);

#ifdef __cplusplus
} /* closing bracket for extern "C" */
#endif

#endif /* !_DR_MAPS_CONST_H */
