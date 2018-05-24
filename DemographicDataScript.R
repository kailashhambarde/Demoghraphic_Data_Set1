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

library(ggplot2)


#in this plot we observe , Pattern of trend is when Internet user decreases their birth rate increase.
#1)in African Counteries they have very high Birth rate and low internet users.
#2)Asin countries have Avreage 
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Regions_2012_Dataset,size=I(5))



#qplot(data=merged,x=Internet.users,y=Birth.rate,

#	colour=Region)

#1. Shapes qplot(data=merged,x=Internet.users,y=Birth.rate,


#*** 4

#shapes

qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Regions_2012_Dataset,size=I(5),shape=I(7))
#shapes are 0 to 25

#transparency
#here for transparency we used alph=I(0.1).
qplot(data = merged,x=Internet.users,y=Birth.rate,colour=Regions_2012_Dataset,size=I(5),shape=I(15),alpha=I(0.1))


#here we give the plot name by using main= "birth rate vs internet users".
qplot(data = merged,x=Internet.users,y=Birth.rate,colour=Regions_2012_Dataset,size=I(10),shape=I(8),main = "Birth rate vs Internet Users")

