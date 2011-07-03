C Copyright (C) 2009 Sandia Corporation.  Under the terms of Contract
C DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
C certain rights in this software
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
C 
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
C 

C=======================================================================
      SUBROUTINE STRTUP (QAINFO)
C=======================================================================
C$Id: strtup.f,v 1.1 1994/01/24 23:00:54 vryarbe Exp $
C$Log: strtup.f,v $
CRevision 1.1  1994/01/24 23:00:54  vryarbe
CInitial revision
C
c Revision 1.1.1.1  1990/08/14  16:16:25  gdsjaar
c Testing
c
c Revision 1.1  90/08/14  16:16:23  gdsjaar
c Initial revision
c 
c Revision 1.1  90/08/09  13:39:46  gdsjaar
c Initial revision
c 

C   --*** STRTUP *** (ETCLIB) Startup program
C   --   Written by Amy Gilkey - revised 11/24/87
C   --
C   --STRTUP should be called at the start of any program.  It performs
C   --initialization details common to all programs.  Specifically, it
C#CTSSC   --   Calls dummy EXPARM to protect filenames and open the standard
C#CTSSC   --      input/output files
C   --   Initializes the CPU time
C   --   Sets the program name, time, and date
C   --   Starts a new page on the standard output
C   --
C   --Parameters:
C   --   QAINFO - IN/OUT - the current program version information:
C   --      QAINFO(1..3) input, QAINFO(4..6) set
C   --      (1) = program name
C   --      (2) = revision date
C   --      (3) = version as "QA xx.xx" or "X  xx.xx" or "   xx.xx"
C   --      (4) = program name with version appended
C   --      (5) = date of current run
C   --      (6) = time of current run

C   --Routines Called:
C#CTSSC   --   EXPARM - (SUPES) Get batch vs. interactive flag
C   --   LENSTR - (STRLIB) Find string length
C   --   BATCH - (ETCLIB) Determine if in batch mode

C#CTSSC   --System Dependencies (CTSS):
C#CTSSC   --   Opens the standard input and standard output to tty
C#CTSSC   --   Calls dummy EXPARM to protect filenames
C#CTSS
      CHARACTER*(*) QAINFO(6)

      LOGICAL BATCH

C#CTSS      CHARACTER*8 CDUM
C#CTSS
C#CTSSC   --Call dummy EXPARM to protect filenames from first write
C#CTSSC   --and to open the standard input/output files
C#CTSS
C#CTSS      CALL EXPARM (CDUM, CDUM, IDUM, IDUM, IDUM, IDUM)
C#CTSS
C   --Initialize the CPU time

      CALL EXCPUS (CPUSEC)

C   --Set the program information array

      QAINFO(4) = QAINFO(1)
      L = MIN (LENSTR(QAINFO(4))+1, 7)
      QAINFO(4)(L:L+1) = QAINFO(3)(4:5)
      IF (QAINFO(4)(L:L) .EQ. ' ') QAINFO(4)(L:L) = '0'
      CALL EXDATE (QAINFO(5))
      CALL EXTIME (QAINFO(6))

C   --Start a new page on the standard output, if non-interactive
      IF (BATCH ()) WRITE (*, '(''1'')')

      RETURN
      END