import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import sqlalchemy as sa

# database credentials
usr  = 'postgres'
pswd = 'postgres'

# create the connection to the database
engine = sa.create_engine(
    'postgresql://{0}:{1}@localhost:5432/{0}' \
    .format(usr, pswd)
)

# read prices from the database
query = 'SELECT price FROM real_estate'
price = pd.read_sql_query(query, engine)

# generate the histograms
ax = sns.distplot(
    price, 
    bins=10, 
    kde=True    # show estimated kernel function
)

# set the title for the plot
ax.set_title('Price histogram with estimated kernel function')

# and save to a file
plt.savefig('../../Data/Chapter02/Figures/price_histogram.pdf')

# finally, show the plot
plt.show()

query3='\
CREATE TABLE Towns (\
  id SERIAL UNIQUE NOT NULL,\
  code VARCHAR(10) NOT NULL, \
  article TEXT,\
  name TEXT NOT NULL, \
  department VARCHAR(4) NOT NULL,\
  UNIQUE (code, department)\
);\
'
query2='drop table if exists towns;'
q2 = pd.read_sql_query(query2, engine)
# insert into towns (
#     code, article, name, department
# )
# select
#     left(md5(i::text), 10),
#     md5(random()::text),
#     md5(random()::text),
#     left(md5(random()::text), 4)
# from generate_series(1, 10000) s(i);