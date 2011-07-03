/*
 * Copyright (C) 2009 Sandia Corporation.  Under the terms of Contract
 * DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
 * certain rights in this software
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * 
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 * 
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 * 
 *     * Neither the name of Sandia Corporation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */
/*====================================================================
 * ------------------------
 * | CVS File Information |
 * ------------------------
 *
 * $RCSfile: md_heap_info_smos.h,v $
 *
 * $Author: gdsjaar $
 *
 * $Date: 2009/06/09 13:32:43 $
 *
 * $Revision: 1.1 $
 *
 * $Name:  $
 *====================================================================*/

/*******************************************************************************
 * Copyright 1995, Sandia Corporation.  The United States Government retains a *
 * nonexclusive license in this software as prescribed in AL 88-1 and AL 91-7. *
 * Export of this program may require a license from the United States         *
 * Government.                                                                 *
 ******************************************************************************/


typedef struct short_pcb_type{
  unsigned int        iregs[32];
  unsigned int        fregs[32];

  int *               text_base;
  unsigned int        text_length;

  int *               data_base;
  unsigned int        data_length;

  int *               comm_base;
  unsigned int        comm_length;

  int *               heap_base;
  unsigned int        heap_length;

  int *               stack_base1;
  unsigned int        stack_length1;

  int *               stack_base2;
  unsigned int        stack_length2;

  int *               stack_base3;
  unsigned int        stack_length3;

} SHORT_PROCESS_PCB_TYPE;


typedef struct alloc_sizehdr_type {

  /*
   * this should be a multiple of 32 bytes for the Paragon!
   */

  int                         size;
  int                         free;
  struct alloc_sizehdr_type   *prev;
  struct alloc_sizehdr_type   *next;
  int                         filler[4];
} ALLOC_LINKHDR_TYPE;