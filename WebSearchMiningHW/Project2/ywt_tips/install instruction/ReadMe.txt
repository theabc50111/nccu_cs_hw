This Lemur project release is for Indri 5.20.

No further development is being done with Indri.  Please check out our latest project,
Lucindri, which is the Indri search logic built on the Lucene search engine.
http://www.lemurproject.org/lucindri.php
https://github.com/lemurproject/Lucindri

This version of Indri was built with gcc version 5.4.  GCC 7+ is not supported.
The java jar files were built with Java 8 (jdk 1.8.0). The java UIs require Java 8.
We have tested using GCC 4.4.7 (CentOS 6.7 linux), 4.8.4 (16.04 linux),
4.2.1 (OS/X 10.11.3), 5.4.0 (16.04 linux), and Visual Studio 2012 (Windows 7, WIN32 and x86_64).  

We suggest creating a Docker container with a tested version of gcc for systems 
that do not support gcc versions lower than gcc 7.
Applications compiled with the Indri API require the following libraries:
   build-essential, g++ (5.4 or earlier), make, zlib1g-dev on linux. 

Indri built with Visual Studio beyond version 2012 has not been tested.   
Applications built in Visual Studio require the additional library wsock32.lib.

Note that OS/X 10.12+ is not supported.  There C++ library
issues for Indri compilation.  Indri built with Visual Studio
beyond version 2012 has not been tested.

