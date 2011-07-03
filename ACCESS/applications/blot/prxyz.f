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

C $Log: prxyz.f,v $
C Revision 1.2  2009/03/25 12:36:46  gdsjaar
C Add copyright and license notice to all files.
C Permission to assert copyright has been granted; blot is now open source, BSD
C
C Revision 1.1  1994/04/07 20:08:13  gdsjaar
C Initial checkin of ACCESS/graphics/blotII2
C
c Revision 1.3  1992/05/22  22:37:30  gdsjaar
c Modified to handle more than 100,000 nodes/elements in printouts
c
c Revision 1.2  1990/12/14  08:55:28  gdsjaar
c Added RCS Id and Log to all files
c
C=======================================================================
      SUBROUTINE PRXYZ (OPTION, NOUT, NDIM, NAMECO, NUMNP, LISNP,
     &   XN, YN, ZN)
C=======================================================================

C   --*** PRXYZ *** (BLOT) Display database coordinates
C   --   Written by Amy Gilkey - revised 02/22/88
C   --
C   --PRXYZ displays the coordinate array.
C   --
C   --Parameters:
C   --   OPTION - IN - '*' to print all, else print options
C   --   NOUT - IN - the output file, <=0 for standard
C   --   NDIM - IN - the number of coordinates per node
C   --   NAMECO - IN - the coordinate names
C   --   NUMNP - IN - the number of nodes
C   --   LISNP - IN - the indices of the selected nodes
C   --   XN, YN, ZN - IN - the nodal coordinates

      CHARACTER*(*) OPTION
      CHARACTER*(*) NAMECO(*)
      INTEGER LISNP(0:*)
      REAL XN(*), YN(*), ZN(*)

      LOGICAL ISABRT

      IF (NOUT .GT. 0) WRITE (NOUT, 10000)

      IF (NOUT .GT. 0) THEN
         WRITE (NOUT, 10010) (NAMECO(I)(:8), I=1,NDIM)
      ELSE
         WRITE (*, 10010) (NAMECO(I)(:8), I=1,NDIM)
      END IF

      DO 100 IX = 1, LISNP(0)
         IF (ISABRT ()) RETURN
         INP = LISNP(IX)
         IF (NOUT .GT. 0) THEN
            IF (NDIM .LE. 2) THEN
               WRITE (NOUT, 10020, IOSTAT=IDUM)
     &            INP, XN(INP), YN(INP)
            ELSE
               WRITE (NOUT, 10020, IOSTAT=IDUM)
     &            INP, XN(INP), YN(INP), ZN(INP)
            END IF
         ELSE
            IF (NDIM .LE. 2) THEN
               WRITE (*, 10020, IOSTAT=IDUM)
     &            INP, XN(INP), YN(INP)
            ELSE
               WRITE (*, 10020, IOSTAT=IDUM)
     &            INP, XN(INP), YN(INP), ZN(INP)
            END IF
         END IF
  100 CONTINUE

      RETURN

10000  FORMAT (/, 1X, 'COORDINATES')
10010  FORMAT (/, 1X, 5X, 6X, 4X, 5 (3X, A8, :, 3X), :, /,
     &   (1X, 5 (3X, A8, :, 3X)))
10020  FORMAT (1X, 'Node ', I6, 4X, 5 (1X, 1PE13.6), :, /,
     &   (1X, 5 (1X, 1PE13.6)))
      END