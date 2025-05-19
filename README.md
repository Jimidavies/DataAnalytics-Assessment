# DataAnalytics-Assessment
**Assessment _Q1: Savings and Deposit Analysis**

**Approach:**
1. Aggregate Savings Count per Customer: Calculated the total number of savings transactions for each customer.
2. Aggregate Confirmed Deposit Amount per Customer: Computed the total confirmed deposit amounts for each customer.
3. Data Integration: Joined the results from the above aggregations to consolidate savings counts and total deposits per customer, facilitating a comprehensive analysis.

**Challenges**
Required an in-depth understanding of the database structure to accurately identify relevant tables and fields for aggregation.

**Assessment_Q2: Monthly Transaction Frequency Categorization**

**Approach:**
1. Monthly Transaction Aggregation: Aggregated transaction data on a monthly basis for each user.
2. Average Transaction Calculation: Calculated the average number of transactions per user.
3. Frequency Categorization: Determined the average transactions per month for each user and categorized them into 'High', 'Medium', or 'Low' frequency groups based on predefined thresholds.
4. Summary Metrics: Compiled the frequency category, corresponding customer count, and average transactions per month for each group.

**Challenges**
Faced complexities in accurately defining categorization thresholds and ensuring consistent classification across diverse user transaction patterns.

**Assessment_Q3: Inactive User Identification**

**Approach:**
1. Active User Selection: Filtered transaction data to include only active users possessing both savings and/or investment accounts.
2. Transaction Ranking: Ranked each user's transactions by date in descending order to identify the most recent activity.
3. Inactive Days Calculation: Determined the number of days since each user's last transaction by calculating the difference between the current date and the last transaction date.
4. Inactive User Filtering: Identified users with inactivity periods exceeding one year for further analysis or targeted engagement strategies.

**Challenges**
Initially encountered difficulties in comprehending the relationships between various database tables, which was essential for accurately linking user accounts and transaction records. But in the end, I understood it.
