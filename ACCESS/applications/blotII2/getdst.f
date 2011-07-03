C Copyright(C) 2009 Sandia Corporation. Under the terms of Contract
C DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
C certain rights in this software.
C         
C Redistribution and use in source and binary forms, with or without
C modification, are permitted provided that the following conditions are
C met:
C 
C     * Redistributions of source code must retain the above copyright
C       notice, this list of conditions and the following disclaimer.
C 
C     * Redistributions in binary form must reproduce the above
C       copyright notice, this list of conditions and the following
C       disclaimer in the documentation and/or other materials provided
C       with the distribution.
C     * Neither the name of Sandia Corporation nor the names of its
C       contributors may be used to endorse or promote products derived
C       from this software without specific prior written permission.
C 
C THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
C "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
C LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
C A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
C OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
C SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
C LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
C DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
C THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
C (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
C OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

C $Id: getdst.f,v 1.1 2009/03/25 04:47:53 gdsjaar Exp $
C $Log: getdst.f,v $
C Revision 1.1  2009/03/25 04:47:53  gdsjaar
C Added blotII2 source since Copyright was asserted.
C
C Update copyright notice in suplib.
C
C Add blotII2 to config files.  Note that blot will not build yet since
C it requires some libraries that are still being reviewed for copyright
C assertion.
C
C Revision 1.1  1994/04/07 20:01:37  gdsjaar
C Initial checkin of ACCESS/graphics/blotII2
C
c Revision 1.2  1990/12/14  08:51:05  gdsjaar
c Added RCS Id and Log to all files
c
C=======================================================================
      SUBROUTINE GETDST( NODE1, NODE2, XN, YN, ZN, DIST)
C=======================================================================

C   --*** GETDST *** (MESH) GETS DISTANCE BETWEEN TWO NODES
C   --   Written by RAY J. Meyers 21 June, 1990
C   --
C   -- calculates the distance between two nodes
C   --    (written because of referencing problem using a(xn) directly )
C   --
C   --Parameters:
C   --
C   --   NODE1 - IN - THE INDEX OF FIRST NODE
C   --   NODE2 - IN - THE INDEX OF FIRST NODE
C   --   XN - IN - THE ROTATED, DEFORMED X COORDINATES
C   --   YN - IN - THE ROTATED, DEFORMED Y COORDINATES
C   --   ZN - IN - THE ROTATED, DEFORMED Z COORDINATES
C   --   DIST - OUT - THE DISTANCE BETWEEN NODE1 AND NODE2

C=======================================================================

      REAL XN(*), YN(*), ZN(*)

      COMMON /D3NUMS/ IS3DIM, NNPSUR, NUMNPF, LLNSET
      LOGICAL IS3DIM

      XDIST = XN(NODE2) - XN(NODE1)
      YDIST = YN(NODE2) - YN(NODE1)
      IF(IS3DIM) THEN
         ZDIST = ZN(NODE2) - ZN(NODE1)
      ELSE
         ZDIST = 0
      END IF

      DIST = SQRT( XDIST*XDIST + YDIST*YDIST + ZDIST*ZDIST)

      RETURN
      END
