library(TDA)

main_path = getwd()
nodes = c('1200', '4800')
names = c('y', 'RC')

par(mfrow = c(3, 2))


data_name = 'test_U'
data_path = paste(c(main_path, '/data/', data_name, '.csv'), collapse = '')
print(data_path)

data = read.csv(file = data_path, header = FALSE, sep = ',')
data = data[, -3]
print(dim(data))
# persistence diagram of alpha complex
DiagAlphaCmplx <- alphaComplexDiag(
  X = data, library = c("GUDHI", "Dionysus"), location = TRUE,
  printProgress = TRUE)
# plot


plot(x = data[, 1], y = data[, 2], type = 'o', col='blue', main = "True curve")
plot(DiagAlphaCmplx[["diagram"]],  legend = c("0 dim (components)", "1 dim (loops)"))


for (i in 1:2)
{
  for (j in 1:2)
  {
    node = nodes[i]
    name = names[j]
    data_name = paste(c('Pred_V_', node, '_', name, '_delay'), collapse = '')
    data_path = paste(c(main_path, '/data/', data_name, '.csv'), collapse = '')
    print(data_name)
    print(data_path)
    
    data = read.csv(file = data_path, header = FALSE, sep = ',')
    data = data[, -3]
    print(dim(data))
    # persistence diagram of alpha complex
    DiagAlphaCmplx <- alphaComplexDiag(
      X = data, library = c("GUDHI", "Dionysus"), location = TRUE,
      printProgress = TRUE)
    # plot
    
    
    plot(DiagAlphaCmplx[["diagram"]])
    #plot(x = data[, 1], y = data[, 2], type = 'o', col = j, main = "Predicted curve")
  }
  
}