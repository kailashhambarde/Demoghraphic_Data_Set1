getwd()
stats<-read.csv("DemographicData.csv")
#read top six records
head(stats)
#check the class of data
class(stats)

#exploring data
stats
#show the number of row in data
nrow(stats)

#show the number of columns in data
ncol(stats)

#show the top 10 record
head(stats,n=10)

#show the last 6 record in data
tail(stats)

#str(stats)shows the briefly about all colunms.it is also called as metadata about data. 
str(stats)

#show the basic statistics about data.
summary(stats)

#using the $ sign

head(stats)
#it show record of in row no.3 ,col no 3 value.
stats[3,3]
#the above exmple shown here.row no3, col on.3.
stats[3,"Birth.rate"]

#shwo top 10 records
head(stats,10)
#whats wrong here,ask sir
stats["Angola",3,]

#it show 1st row and 3rd col.
stats[1,3]
#
#it show only angola row name. 3rd row 1 name
stats[3,1]

#it shows 3 rd row . [3,] , means show all the row record in this row.dont skip
stats[3,]

#it shows below Internet.usres columns data.RETURNS VECTOR DATA
stats$Internet.users


#it also do the same thing above. it show birth.rate column.
#[,3]means skip the 1 and 2 columns and only show the 3 column.
stats[,3]

#here is the sme thing explain in above exmple.
stats[,"Internet.users"]

#********
#it show Income.Grup column data.
stats$Income.Group

#create factor means give the lable.
col<-levels(stats$Income.Group)
col

#Basic Operations with DF.

#it show top 10 record. both row and columns.
stats[1:10,]

#it skip 1 and 2 row, and show from 3 to 9 row number data,
#columns are same shown which are row shows.
stats[3:9,]

#show the row number 4 and 100. coloumns shows sme as row.
stats[c(4,100),]

#Error in `[.data.frame`(stats, c(4, 100)) : undefined columns selected
stats[c(4,100)]

head(stats)

#show the row number columns no 1 value, and 100 column no value.
stats[c(1,100),4]

#show column number 4, that is Internet.usres.
stats[,4]


#show column number 1 and 4. that is Country.name and Internet.usres.
stats[,c(1,4)]

#Error: unexpected ',' in "stats[(4,"(cobination)
stats[(4,100),]#we not provide c operatr here

#NULL Value
stats[4,100,]
 

#show the Albania row.
stats[4,]

##show the Aruba row.
stats[1,]

#show the 1 column in data, that is Country.Name.
head(stats[1])

head(stats[,1])

stats[1]

#top six Country Names.
head(stats$Country.Name)

#shwo 1 column all Countery.Names.
stats$Country.Name
#shwo 1 column all Countery.Names.
stats[1]

#check class
is.data.frame(stats[1])

#this is first row and all col.
stats[1,]

#check class
is.data.frame(stats[1,])


stats[1]


is.data.frame(stats[1])

#this is all rows and first col.
stats[,1]


is.data.frame(stats[,1])


#multiplycol

#shows all columns.
head(stats,n=10)

stats$Birth.rate*stats$Internet.users

head(stats$Birth.rate*stats$Internet.users)

stats$Birth.rate+stats$Internet.users

head(stats)


#creating or adding new column in stats that is MyCalc. 
#In this new column we calculate Birth.rate*Internet.users
stats$MyCalc<-stats$Birth.rate*stats$Internet.users



head(stats)

#add another Column to Stats, that is MyCalc2, 
#and we copy the Mycalc values and paste it in new added column that is MyCalc2
stats$MyCalc2<-stats$MyCalc

head(stats)


#in this where we created duplicate data, so we need to delet the on of column.
#so we delet this by using NULL cmmd.
stats$MyCalc<-NULL

head(stats)
head(stats)

#we are also delect this bcoz this data no sence.
stats$MyCalc2<-NULL

#by using sum fun we calculate the sum of any number.
#in this where we calculate total Birth.rate.
sum(stats$Birth.rate)

stats[4,1]

#everything is vectorized operation

1:5

#n means number of row and columns. in this where shwo the 12 row and 12 columns aswell.
head(stats,n=12)

#in this where we add new column.it accepted bcoz it 195 divible by 5.
stats$XYZ<-1:5
head(stats,n=12)
stats$XYZ<-NULL


#whats worng here
stats$xyz<-1:4
#in above cmmd, we add new column with 1:4 value.
#r give error bcoz stats data has 195 rows, so if we divide 195/4 its seem 48.5.
#so r not accepted this. if 195 divible then this accepted.
#Error in `$<-.data.frame`(`*tmp*`, xyz, value = 1:4) :replacement has 4 rows, data has 195


#number of rows
nrow(stats)


#filtering a DF

#filter the Internet user who has <2 uses.
stats$Internet.users<2

#create a new object and save filter values.
filter<-stats$Internet.users<2
filter

#countries with it 2% internet users.
stats[filter,]

#countries with it greter then 40% Birth rate.
stats[stats$Birth.rate>40,]

#it shows countries with it greter then 40% Birth rate and 2% internet user.
stats[stats$Birth.rate>40 & stats$Internet.users<2,]

#countries with High Income rate.
stats[stats$Income.Group=="High income",]

stat[stats$Country.Name=="Malta",]


?qplot
#Quick Plot

#qplot is a shortcut designed to be familiar if you're used to base plot().
#It's a convenient wrapper for creating a number of different types of plots 
#using a consistent calling scheme. It's great for allowing you to produce 
#plots quickly, but I highly recommend learning ggplot() as it makes it easier 
#to create complex graphics.

library(ggplot2)

#install.packages("ggplot2")

qplot(data = stats,x=Internet.users)

#in this plot we interprate observe that, 
#1)if internet uses is increase then Birth rate is High.
#2)some of the countries has high birth rate but they have very low internet uses.
qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(3))


#In this plot we observe that,
#1) in High income they have very low Birth rate.
#2)In Low income they have very high Birth rate.
#3)in Lower middle they have average birth rate.
#4)in Upper middle income they have below average birth rate
#As per data we can see that when income is high their birth rate is low,
#and when income is low their birth rate is High.
#As per data we can also say that , when Birth rate is high this counteries have low income.
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3))

#colour=blue
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),colour=("blue"))

#this cmmd increase the plot point size.
qplot(data = stats,x=Income.Group,y=Birth.rate,size=3)
qplot(data = stats,x=Income.Group,y=Birth.rate,size=30)

#in this where we increase the plot point size by 6
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(6))#colour="blue")

#change the colour of plot to blue by using I cmmd.
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))
?I

#colour = pink     
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),colour=I("pink"))  

#Colour=Green
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),colour=I("green")) 

qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),colour="pink") 

#creating Box plot
qplot(data = stats,x=Income.Group,y=Birth.rate,size=I(3),geom="boxplot") 

#Visualization

qplot(data = stats,x=Internet.users,y=Birth.rate)

#scatterplot

qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(4))

#colour and size change
qplot(data = stats,x=Internet.users,y=Birth.rate,colour=I("red"),size=I(4))

head(stats)

#In this plot we add Internet.Users in X bar, Birth in rate in y, and we colour the points,
#based on Income Group.
#in this where we observe that,
#Colour= Red :- They have High Income, High Internet Users but low Birth rate.
#Colour= Green :- they have Low Income,Low Internet Users and also Birth rate is low.
#Colour= Blue :- they have average Income, average internet users and average Birth rate.
#Colour= Purple :- High Income, high internet users but low Birth rate.
qplot(data = stats,x=Internet.users,y=Birth.rate,colour=Income.Group,size=I(4))

Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote  d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt,  Arab

                            Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia,  Fed.
                            Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea- Bissau","Equatorial  Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz
                            Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius"," Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French  Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian  Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad  and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United  States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")

#we create a new object which contain Counteries code

Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","
BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CA
                        N","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU",
                        "DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","
                        GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV"
                        ,"HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KH
                        M","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","M
                        AR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","M
                        WI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PH
                        L","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","S
                        LE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","
                        TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR"
                        ,"VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The

                          Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa"
                          ,"Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The  Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle  East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia"
                          ,"The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","A frica","Oceania","Africa","Africa","The  Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle  East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The  Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")
Regions_2012_Dataset

mydf <-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
mydf
head(mydf)
colnames(mydf)
tail(mydf)
summary(mydf)

#--- merging DFs head(stats)


head(mydf)


#in where we marged x column with y.that is Countery.code by code.
#here marge is function, stats is old df and mydf is new df
merged <- merge(stats,mydf,by.x="Country.Code",by.y="Codes_2012_Dataset")



head(merged)



merged$Country <- NULL #why



head(merged)


#meta data about data.
str(merged)


#last 6
tail(merged)




#--- Visualizing

#install.packages("ggplot2")

#library(ggplot2)



qplot(data=merged,x=Internet.users,y=Birth.rate)



#qplot(data=merged,x=Internet.users,y=Birth.rate,

#	colour=Region)

#1. Shapes qplot(data=merged,x=Internet.users,y=Birth.rate,
colour=Region, size=I(5))

#*** 4



qplot(data=merged,x=Internet.users,y=Birth.rate, colour=Region, size=I(5),shape=I(7))
#shapes r from 0 to 25



qplot(data=merged,x=Internet.users,y=Birth.rate, colour=Region, size=I(5),shape=I(2))


qplot(data=merged,x=Internet.users,y=Birth.rate, colour=Region, size=I(5),shape=I(15))


qplot(data=merged,x=Internet.users,y=Birth.rate, colour=Region, size=I(5),shape=I(23))

#2. Transparency qplot(data=merged,x=Internet.users,y=Birth.rate,
colour=Region, size=I(5),shape=I(19), alpha=I(0.1))


qplot(data=merged,x=Internet.users,y=Birth.rate, colour=Region, size=I(5),shape=I(19), alpha=I(0.6))# notice overlap pts


qplot(data=merged,x=Internet.users,y=Birth.rate, colour=Region, size=I(5),shape=I(19), alpha=I(0.6), main="Birth Rate vs Internet Users")


#*** 5














































### World Trends getwd()

data <- read.csv("Trends.csv")



head(data)



#Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote  d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt,  Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia,  Fed.
Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea- Bissau","Equatorial  Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz
Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius"," Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French  Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian  Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad  and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United  States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
#Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","
BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CA
N","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU",
"DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","

GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV"
,"HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KH
M","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","M
AR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","M
WI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PH
L","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","S
LE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","
TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR"
,"VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")

#Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa"
,"Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The  Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle  East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia"
,"The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","A frica","Oceania","Africa","Africa","The  Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle  East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The  Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")


Country_Code <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","
BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE
","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYP","CZE","DEU","DJI","DNK","D

OM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","G
IN","GMB","GNB","GNQ","GRC","GRD","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","I
ND","IRL","IRN","IRQ","ISL","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LA
O","LBN","LBR","LBY","LCA","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX
","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","
NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY"
,"PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SSD","STP","SU
R","SVK","SVN","SWE","SWZ","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","
TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","WSM","YEM","ZAF","COD","Z MB","ZWE")
Life_Expectancy_At_Birth_1960 <- c(65.5693658536586,32.328512195122,32.9848292682927,62.2543658536585,52.2432195121951,65.2 155365853659,65.8634634146342,61.7827317073171,70.8170731707317,68.5856097560976,60.8362
43902439,41.2360487804878,69.7019512195122,37.2782682926829,34.4779024390244,45.82931707
31707,69.2475609756098,52.0893658536585,62.7290487804878,60.2762195121951,67.70809756097
56,59.9613658536585,42.1183170731707,54.2054634146342,60.7380487804878,62.5003658536585,3
2.3593658536585,50.5477317073171,36.4826341463415,71.1331707317073,71.3134146341463,57.45
82926829268,43.4658048780488,36.8724146341463,41.523756097561,48.5816341463415,56.716756
097561,41.4424390243903,48.8564146341463,60.5761951219512,63.9046585365854,69.5939268292
683,70.3487804878049,69.3129512195122,44.0212682926829,72.1765853658537,51.8452682926829,
46.1351219512195,53.215,48.0137073170732,37.3629024390244,69.1092682926829,67.90597560975
61,38.4057073170732,68.819756097561,55.9584878048781,69.8682926829268,57.5865853658537,39.
5701219512195,71.1268292682927,63.4318536585366,45.8314634146342,34.8863902439024,32.042
2195121951,37.8404390243902,36.7330487804878,68.1639024390244,59.8159268292683,45.531634
1463415,61.2263414634146,60.2787317073171,66.9997073170732,46.2883170731707,64.608658536
5854,42.1000975609756,68.0031707317073,48.6403170731707,41.1719512195122,69.691756097561,
44.945512195122,48.0306829268293,73.4286585365854,69.1239024390244,64.1918292682927,52.68
52682926829,67.6660975609756,58.3675853658537,46.3624146341463,56.1280731707317,41.23202
43902439,49.2159756097561,53.0013170731707,60.3479512195122,43.2044634146342,63.28012195
12195,34.7831707317073,42.6411951219512,57.303756097561,59.7471463414634,46.510707317073
2,69.8473170731707,68.4463902439024,69.7868292682927,64.6609268292683,48.4466341463415,61.
8127804878049,39.9746829268293,37.2686341463415,57.0656341463415,60.6228048780488,28.211
6097560976,67.6017804878049,42.7363902439024,63.7056097560976,48.3688048780488,35.003707
3170732,43.4830975609756,58.7452195121951,37.7736341463415,59.4753414634146,46.880390243
9024,58.6390243902439,35.5150487804878,37.1829512195122,46.9988292682927,73.392682926829
3,73.549756097561,35.1708292682927,71.2365853658537,42.6670731707317,45.2904634146342,60.8
817073170732,47.6915853658537,57.8119268292683,38.462243902439,67.6804878048781,68.71960
97560976,62.8089268292683,63.7937073170732,56.3570487804878,61.2060731707317,65.64243902
43903,66.0552926829268,42.2492926829268,45.6662682926829,48.1876341463415,38.206,65.659829
2682927,49.3817073170732,30.3315365853659,49.9479268292683,36.9658780487805,31.676707317
0732,50.4513658536585,59.6801219512195,69.9759268292683,68.9780487804878,73.005609756097

6,44.2337804878049,52.768243902439,38.0161219512195,40.2728292682927,54.6993170731707,56.1
535365853659,54.4586829268293,33.7271219512195,61.3645365853659,62.6575853658537,42.0097
56097561,45.3844146341463,43.6538780487805,43.9835609756098,68.2995365853659,67.89639024
39025,69.7707317073171,58.8855365853659,57.7238780487805,59.2851219512195,63.73021951219
51,59.0670243902439,46.4874878048781,49.969512195122,34.3638048780488,49.0362926829268,41.
0180487804878,45.1098048780488,51.5424634146342)

Life_Expectancy_At_Birth_2013 <- c(75.3286585365854,60.0282682926829,51.8661707317073,77.537243902439,77.1956341463415,75.9 860975609756,74.5613658536585,75.7786585365854,82.1975609756098,80.890243902439,70.69314
63414634,56.2516097560976,80.3853658536585,59.3120243902439,58.2406341463415,71.24524390
2439,74.4658536585366,76.5459512195122,75.0735365853659,76.2769268292683,72.470731707317
1,69.9820487804878,67.9134390243903,74.1224390243903,75.3339512195122,78.5466585365854,69.
1029268292683,64.3608048780488,49.8798780487805,81.4011219512195,82.7487804878049,81.197
9268292683,75.3530243902439,51.2084634146342,55.0418048780488,61.6663902439024,73.809731
7073171,62.9321707317073,72.9723658536585,79.2252195121951,79.2563902439025,79.949780487
8049,78.2780487804878,81.0439024390244,61.6864634146342,80.3024390243903,73.319902439024
4,74.5689512195122,75.648512195122,70.9257804878049,63.1778780487805,82.4268292682927,76.4
243902439025,63.4421951219512,80.8317073170732,69.9179268292683,81.9682926829268,68.9733
902439024,63.8435853658537,80.9560975609756,74.079512195122,61.1420731707317,58.21648780
4878,59.9992682926829,54.8384146341464,57.2908292682927,80.6341463414634,73.193560975609
8,71.4863902439024,78.872512195122,66.3100243902439,83.8317073170732,72.9428536585366,77.1
268292682927,62.4011463414634,75.2682926829268,68.7046097560976,67.6604146341463,81.0439
024390244,75.1259756097561,69.4716829268293,83.1170731707317,82.290243902439,73.46892682
92683,73.9014146341463,83.3319512195122,70.45,60.9537804878049,70.2024390243902,67.7720487
804878,65.7665853658537,81.459756097561,74.462756097561,65.687243902439,80.1288780487805,
60.5203902439024,71.6576829268293,74.9127073170732,74.2402926829268,49.3314634146342,74.1
634146341464,81.7975609756098,73.9804878048781,80.3391463414634,73.7090487804878,68.8115
12195122,64.6739024390244,76.6026097560976,76.5326585365854,75.1870487804878,57.53519512
19512,80.7463414634146,65.6540975609756,74.7583658536585,69.0618048780488,54.64151219512
2,62.8027073170732,74.46,61.466,74.567512195122,64.3438780487805,77.1219512195122,60.828146
3414634,52.4421463414634,74.514756097561,81.1048780487805,81.4512195121951,69.222,81.40731
70731707,76.8410487804878,65.9636829268293,77.4192195121951,74.2838536585366,68.13156097
56097,62.4491707317073,76.8487804878049,78.7111951219512,80.3731707317073,72.79917073170
73,76.3340731707317,78.4184878048781,74.4634146341463,71.0731707317073,63.3948292682927,7
4.1776341463415,63.1670487804878,65.878756097561,82.3463414634146,67.7189268292683,50.363
1219512195,72.4981463414634,55.0230243902439,55.2209024390244,66.259512195122,70.99,76.260
9756097561,80.2780487804878,81.7048780487805,48.9379268292683,74.7157804878049,51.191487
8048781,59.1323658536585,74.2469268292683,69.4001707317073,65.4565609756098,67.522365853
6585,72.6403414634147,70.3052926829268,73.6463414634147,75.1759512195122,64.291829268292
7,57.7676829268293,71.159512195122,76.8361951219512,78.8414634146341,68.2275853658537,72.8

108780487805,74.0744146341464,79.6243902439024,75.756487804878,71.669243902439,73.250390
2439024,63.583512195122,56.7365853658537,58.2719268292683,59.2373658536585,55.633)




#Explore the data head(data)


#Find from what is the range of years v hv the data tail(data)


tail(data, n=7) #check bottom 7 rows



str(data)	#check the structure of the data frame

#notice year



summary(data)	#check the summary of the data

#note Country.Code



data$Year

#convert this to a factor



temp <- factor(data$Year) temp


levels(temp)

#filter the df, only 1960s data data$Year == 1960


data1960 <- data[data$Year == 1960,]



head(data1960)



data2013 <- data[data$Year == 2013,]



nrow(data1960)



nrow(data2013)



head(data1960)



#create additional dfs

add1960 <- data.frame(Country=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
head(add1960)



add2013 <- data.frame(Country=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)
head(add2013)



#check summaries

summary(add1960)



summary(add2013)



head(data1960) head(add1960)
#merge the pairs of dfs

merged1960 <- merge(data1960,add1960, by.x="Country.Code", by.y="Country")
head(merged1960)



merged2013 <- merge(data2013,add2013, by.x="Country.Code", by.y="Country")
head(merged2013)

#add1960 <- data.frame(Country=Country_Code,

#	Life.Exp=Life_Expectancy_At_Birth_1960)






#check the new structs



str(merged1960) str(merged2013)



head(merged1960)



head(merged2013)



merged1960$Year <-NULL



merged2013$Year <-NULL




#visualize the 1960 dataset

#qplot(data=merged1960,x=Fertility.Rate,

#y=Life.Exp, colour=Region)



qplot(data=merged1960,x=Fertility.Rate, y=Life.Exp, colour=Region, size=I(5),alpha=I(0.5),
main="Life Expectancy vs Fertility (1960)")

#Fertility is num of children per 100 ppl



qplot(data=merged2013,x=Fertility.Rate, y=Life.Exp, colour=Region, size=I(5),alpha=I(0.6),
main="Life Expectancy vs Fertility (2013)")
