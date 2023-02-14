# Background
Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this homework assignment, you will apply your new SQL skills to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

You are asked to accomplish three main tasks:

 1. Data Modeling: Define a database model to store the credit card transactions data and create a new PostgreSQL database using your model.
 2. Data Engineering: Create a database schema on PostgreSQL and populate your database from the CSV files provided.
 3. Data Analysis: Analyze the data to identify possible fraudulent transactions trends data, and develop a report of your observations.
 

* What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction? Explain your rationale in the markdown report.
The different between the consumption patterns between card holder(ch) 2 and ch18 is that for ch2 the pattern is very consistent for the entire year (2018), the transactions are all between 0 and 20 dollars. For ch18, there are really high spikes throughout the year, some almost topping 2000 dollar for one transaction. I think for ch2, the transactions are in a tight range and there is not much suspicion of fraudulent activities. However, for ch18 there are very large transactions that can suggest to some fraudulent activity. Ch18 has most transactions falling below 20 dollars but there are 3 transactions over 1750, 4 above 970, 1 over 450, and 1 over 330 that may seem a bit suspect.

* Are there any outliers for cardholder ID 25? How many outliers are there per month?
Yes, card holder(ch) 25 seems to have had about 9 transactions that were outliers through the first six months of 2018. For the months of April and June, ch25 had 3 large transactions out of the norm each month, 3 months out of the six had one large outlier transaction, and February was the only month that seemed to not have any outliers.

* Do you notice any anomalies? Describe your observations and conclusions in your markdown report.
Yes, I think that most adults have at least one large transaction per month, whether that is rent, a car note, or a mortgage. But for the month of June there were three transactions that really stood out to me. There were two transactions that were above 1000 dollars and one over 750, not to mention the smaller transactions that were made that month. Either ch25 had a lot of money saved up and unloaded on vacations(flights, hotels, rental, activites) or other things, or this could raise some eyebrows to the banks fraudulent detection tema