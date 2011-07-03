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

C $Id: zaway.f,v 1.1 2009/03/25 04:47:54 gdsjaar Exp $
C $Log: zaway.f,v $
C Revision 1.1  2009/03/25 04:47:54  gdsjaar
C Added blotII2 source since Copyright was asserted.
C
C Update copyright notice in suplib.
C
C Add blotII2 to config files.  Note that blot will not build yet since
C it requires some libraries that are still being reviewed for copyright
C assertion.
C
C Revision 1.1  1994/04/07 20:18:19  gdsjaar
C Initial checkin of ACCESS/graphics/blotII2
C
c Revision 1.2  1990/12/14  08:59:41  gdsjaar
c Added RCS Id and Log to all files
c
C=======================================================================
      LOGICAL FUNCTION ZAWAY (NLNKF, LINKF1, XN, YN, ZN, HIDENP)
C=======================================================================

C   --*** ZAWAY *** (MESH) Determine if face is hidden
C   --   Written by Amy Gilkey - revised 10/22/87
C   --              Sam Key, 03/01/85
C   --
C   --ZAWAY determines if a face on a 3D surface is hidden.
C   --It is hidden if and only if its outward normal points "into" the
C   --plotting surface.  Nodes within the face are marked as
C   --visible if the face is visible.
C   --
C   --Parameters:
C   --   NLNKF - IN - the number of nodes per face
C   --   LINKF1 - IN - the connectivity for the face
C   --   XN, YN, ZN - IN - the nodal coordinates; the Z-coordinate is
C   --      pointing towards the viewer (out of the plotting plane)
C   --   HIDENP - IN/OUT - node status (as in HIDDEN)

      PARAMETER (KNVIS=0, KNFOVR=10, KNHID=100)

      INTEGER LINKF1(NLNKF)
      REAL XN(*), YN(*), ZN(*)
      INTEGER HIDENP(*)

C   --Form X and Y components of diagonal vectors of face
C   --(calculate from midpoint of each side)

      AX = (XN(LINKF1(3)) + XN(LINKF1(4)))
     &   - (XN(LINKF1(1)) + XN(LINKF1(2)))
      BX = (XN(LINKF1(4)) + XN(LINKF1(1)))
     &   - (XN(LINKF1(2)) + XN(LINKF1(3)))
      AY = (YN(LINKF1(3)) + YN(LINKF1(4)))
     &   - (YN(LINKF1(1)) + YN(LINKF1(2)))
      BY = (YN(LINKF1(4)) + YN(LINKF1(1)))
     &   - (YN(LINKF1(2)) + YN(LINKF1(3)))

C   --Form Z component of normal vector to corner, and make node
C   --visible if normal points forward

      ZAWAY = (AX*BY .LE. BX*AY)

      IF (.NOT. ZAWAY) THEN
         DO 100 ILINK = 1, 4
            HIDENP(LINKF1(ILINK)) = KNVIS
  100    CONTINUE
      END IF

      RETURN
      END
