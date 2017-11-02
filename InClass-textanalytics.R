#1
print("a")
print("\"")
print('"')

cat("\"")
cat("ab\ncd")
cat("a\tb\nc\td")

#2
cat(":-\\")
cat("(^_^\")")
cat("@_'-'")
cat("\\m/")

#3
library(stringr)
?str_locate
?str_sub

#4
str_locate(string = "great", pattern = "a")

list = c("great", "fantastic", "super")
str_locate(string = list, pattern = "a")
str_locate_all(string = list, pattern = "a")
occurance = str_locate_all(string = list, pattern = "a")

occurance[1]
#occurance[1,1] #wrong
x = occurance[[1]] #right
x[1]

### or
occurance[[1]][1]

#5
str_sub(string = "testing", start = 1, end = 3)
#same as before
str_sub(string = "testing", end = 3)

str_sub(string = "testing", start = 1, end = 4)
str_sub("testing",
        start = 1, end = 4)

str_sub("testing", 
        start = 4, 
        end = str_length("testing"))

#6
input <-c("abc", "defg")
str_sub(input, c(2,3))

#7
emails <- readRDS("email.rds")
emails[1]
cat(emails[1])
cat(emails[10])

str_locate(string = emails[1],
           pattern = "\n")
str_locate(string = emails[1],
           pattern = "\n\n")

#8
metadata1 = str_sub(string = emails[1],
                  start = 1,
                  end = 842)
body1 = str_sub(string = emails[1],
                start = 844)
cat(metadata1)
cat(body1)

#9
str_split(string = metadata1,
          pattern = "\n")

#10

breaks = str_locate(string = emails,
        pattern = "\n\n")
metadata = str_sub(string = emails,
                   start = 1,
                   end = breaks[,1])
body = str_sub(string = emails,
        start = breaks[,2])

### Handout 2

#1
fruit = c("apple", "banana",
          "pear", "pineapple")

#2
str_detect(fruit, "a")
str_detect(fruit, pattern = "^a")
str_detect(fruit, pattern = "a$")
str_detect(fruit, "[aeiou]")
str_detect(fruit, "[a-d]")

# detect a string that starts with "a" and ends with "e"

#3
str_detect(fruit, "^a...e")
str_detect(fruit, "^a[a-z]*e$")

#4
phone = c("213 740 4826")
parser = "[0-9]{3} [0-9]{3} [0-9]{4}"
str_detect(phone, parser)

phone = c("213 740 4826", "213-740-4826")
parser = "[0-9]{3}[ -][0-9]{3}[ -][0-9]{4}"
str_detect(phone, parser)

phone = c("213 740 4826", "213-740-4826",
          "213.740.4826")
parser = "[0-9]{3}[ -.][0-9]{3}[ -.][0-9]{4}"
str_detect(phone, parser)

phone = c("213 740 4826", "213-740-4826",
          "213.740.4826", "(213) 740-4826")
parser = "[(]?[0-9]{3}[)]?[ -.][0-9]{3}[ -.][0-9]{4}"
str_detect(phone, parser)

#5
cat(body[10])
cat(body[18])

str_extract(string = body, pattern = parser)

#6
zipcode = c("90028", "90028-0809")
parser = "[0-9]{5}(-[0-9]{4})?"
str_detect(zipcode, parser)
