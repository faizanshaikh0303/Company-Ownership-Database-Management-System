# Company-Ownership-Database-Management-System

CSE 532: Project - 
Web of Company Ownership using Flora-2, Object-Oriented Extensions of SQL (PostgreSQL), XQuery language (under Prof. Michael Kifer)

The WOCO database contains information about companies, owners (based on the number of shares
owned), and board members (of those companies).

The following queries have been implemented in each of the three approaches taken via different database management systems:

1. Find all companies that are (partially) owned by one of their board members.

2. Find the net worth for every person in the database. The net worth of a person is summation of shares * share price, where the sum is taken over all the companies directly owned by that person, sharesi is the number of the shares in company i that the person owns, and share price is the price of a share in company i.

3. For each company, find the board member that owns the most shares of that company among all the board members of that company.

4. Find all pairs (company1; company2) such that company1 =/= company2, they belong to the same industry (one of the industries they belong to must be the same), and the board of company1 dominates the board of company2. The latter means that, for every board member p2 in company2 and for any company c that p2 owns some shares of, there is a board member p0 in company1 who owns as many or more shares of c.

5. For each person, find the companies he controls and the percentage of control, if that percentage is greater than 10%. An entity (a person or a company) controls a company if that entity controls the company directly or indirectly. (Directly controlling a company means owning part of it. Indirectly controlling a company c means directly controlling another company, c0, where
c0 controls c directly or indirectly.) 
Note that one may control the same company both directly and indirectly through multiple direct-ownership chains and, in this case, all percentages must be summed up. More precisely, percentage of control of p over company c is defined as follows:
controlPercentage(p; c) = sumation(p=c0;c1;c2;:::;cn=c) control(c0; c1; c2; :::; cn)
(n > 0), where the sum is over all the direct or indirect ownership chains from p = c0 to c = cn
and
control(c0; c1; c2; :::; cn) = 100 * product from i=0 to n-1 (ci:sharesOf(ci+1)=ci+1:totalShares)
Here ck:totalShares is the total number of shares issued by company ck (k = 1; :::; n) and ck:sharesOf(ck+1) (k = 0; :::; n - 1) denotes the number of shares that ck (which can be a person or a company) owns in company ck+1.
