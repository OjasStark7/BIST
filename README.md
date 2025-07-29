# BIST
In this project, I have implemented a Built In Self Test (BIST) using a modular LFSR as TPG, a CUT and an SISR as ORA. The BIST is used to test the circuit and give the final signature as the output.

The characteristic polynomial used for the LFSR & the SISR is: Φ(x) = x^4 + x^3 + x^2 + 1 & the circuit used as the CUT is f = a.b + c.d.

The LFSR first generates the output pattern Q0-Q3 using the seed 0001, these values are then fed a,b,c,d as Q0-Q3 are connected to a-d. Hence, we get a sequence value for f, which is 0111000. Now, this f is fed as the input m(t) to the SISR and we get the final output value of the signature as 0100. Only 7 cycles are used to get the signature as the characteristic polynomial I used is not a primitive polynomial and after 7 cycles of the clock, the values are repeated and so we can get our output in only 7 cycles.

Further information on how the bist works and how these values are calculated can be seen in the bist_notes.pdf.
