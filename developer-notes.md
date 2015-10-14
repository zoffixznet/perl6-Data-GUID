### Just some notes I kept for myself while reading the RFC

http://www.rfc-base.org/txt/rfc-4122.txt

#### Format

The UUID format is 16 octets

   0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                          time_low                             |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |       time_mid                |         time_hi_and_version   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |clk_seq_hi_res |  clk_seq_low  |         node (0-1)            |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                         node (2-5)                            |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

The timestamp is a 60-bit value.  For UUID version 1, this is represented by
Coordinated Universal Time (UTC) as a count of 100-nanosecond intervals
since 00:00:00.00, 15 October 1582

For UUID version 4, clock sequence is a randomly or pseudo-randomly
   generated 14-bit value as described in Section 4.4.

For UUID version 4, the node field is a randomly or pseudo-randomly
   generated 48-bit value as described in Section 4.4.


#### Misc bits and pieces

* A UUID is 128 bits long
* Each field is treated as an integer and has its value printed as a
zero-filled hexadecimal digit string with the most significant
digit first.  The hexadecimal values "a" through "f" are output as
lower case characters and are case **insensitive** on input.


      The formal definition of the UUID string representation is
      provided by the following ABNF [7]:

      UUID                   = time-low "-" time-mid "-"
                               time-high-and-version "-"
                               clock-seq-and-reserved
                               clock-seq-low "-" node
      time-low               = 4hexOctet
      time-mid               = 2hexOctet
      time-high-and-version  = 2hexOctet
      clock-seq-and-reserved = hexOctet
      clock-seq-low          = hexOctet
      node                   = 6hexOctet
      hexOctet               = hexDigit hexDigit
      hexDigit =
            "0" / "1" / "2" / "3" / "4" / "5" / "6" / "7" / "8" / "9" /
            "a" / "b" / "c" / "d" / "e" / "f" /
            "A" / "B" / "C" / "D" / "E" / "F"