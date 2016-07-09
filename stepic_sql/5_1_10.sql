Представлены модели новостного сайта: новости и тэги. 
У каждой новости может быть несколько тегов, также каждый 
тег относится к нескольким новостям. Допишите определение поля NewsItem.tag: 
что нужно вставить вместо [определение_поля], чтобы реализовать требования к схеме данных?

class Tag(models.Model):
    title = models.CharField(max_length=250)

class NewsItem(models.Model):
    title = models.CharField(max_length=250)
    date = models.DateTimeField(auto_now_add=True)
    description = models.TextField()
    tag = [определение_поля]
    
    
    
ответ :

models.ManyToManyField(Tag)
