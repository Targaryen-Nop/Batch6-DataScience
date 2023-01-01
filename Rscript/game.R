cat("Welcome to Pao-Ying-Choop Game \n \n" ) 
cat("=> Things You Should Know <= \n " ) 
cat("1 is 'Rock' : beats scissors and loses to paper. \n",
    "2 is 'Scissors' : beat paper but loses to rock. \n",
    "3 is 'Paper' : beats rock, but loses to scissors.\n ", 
    "Exit this game : Please enter 4 \n \n")

result <- function(player,bot){
    if(player == 1 ){
         if(bot == 1){ 
          0
          } else if(bot == 2){
          1
          } else if(bot == 3){  
          0
          } 
   } else if(player == 2 ){
          if(bot == 1){ 
            0 
            } else if (bot == 2){
            0
            } else if (bot == 3){
            1
            }
   } else if(player == 3 ){
          if(bot == 1){ 
           1
          } else if (bot == 2){
           0 
          } else if (bot == 3){
           0
          }
   }
      else{
     "END GAME"
  } 
  }

Show_result <- function(z){
  if(z == 1){
    "You win  : got 1 point"
  } else {
    "You loss/tie : got 0 point"
  }
}
  
x <- function(player){
  if(player==1){
    value[1]
  }else if(player==2){
    value[2]
  }else if(player==3){
    value[3]
  } 
  }

y <- function(bot){
  if(bot==1){
    value[1]
  }else if(bot==2){
    value[2]
  }else if(bot==3){
    value[3]
  }
}

key <- c(1,2,3)
value <- c("Rock","Scissors","Paper")
u_score <- 0
Round <- 1
 while(TRUE){
    cat("\n \n Round :",Round,"\n")
    cat("Please you enter number 1,2,3,4 \n")
    player <- readLines("stdin",n=1)
    bot <- sample(key,1) 
   if(player %in% 1:3){
     z <- result(player,bot)
     u_score <- u_score+ z
     cat(x(player),"VS",y(bot),"=>",Show_result(z))
     Round <- Round +1
   } else{
     cat("Total_Your_Point",u_score,"Good Job!!! Thank you")
     break
     
   }
    
 } 
