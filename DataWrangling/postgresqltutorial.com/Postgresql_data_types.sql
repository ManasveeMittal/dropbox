Overview of PostgreSQL data types

PostgreSQL supports the following data types:

    Boolean(bool):
    	Possible values:  true, false or NULL
    	1, yes, y, t, true are converted to true, and 
    	0, no, n false, f are converted to false.

    	When you select data from a Boolean column, 
    	PostgreSQL displays:
    		 t for true,
    		 f for false,
    		 space character for NULL.

    'Character-types':
    	> 'char(n)':fixed-length character with blank padded
    	> 'varchar(n)': variable-length(upto n) character strings, no padded spaces
    	> 'text': variable-length character strings
    'Number-type':
    	'integer':
    		smallint: 2 B signed integer; range (-32768 ,32767)
            int     : 4 B signed integer; range (-214783648, -214783647) i.e (-2^32, 2^32-1)
            Serial  : auto-increment integer
        'Floating-point number':
        	float(n)      : precison -> at least n, max size 8 B
        	real or float8: precison -> double,     fix size 8 B 

    'Temporal data types': time and date  realated data
    	date        : date valueS only.
        time        : time of day values.
        timestamp   : date and time.
        interval    : periods of time.
        timestamptz : store both timestamp and time zone data.

    'Special data types': related to geometric and network.
     	box         : rectangular box.
     	line        : set of points.
     	point       : geometric pair of numbers.
     	lseg        : line segment.
     	polygon     : a closed geometric.
     	inet        : IP4 address.
     	macaddr     : MAC address.
	'Arrays':
		>stores an array of strings>
		        an array of integers, etc., in an array column of a table. 
        Utility: The array comes to handy in some situations e.g., storing days of the week, months of the year, etc.





