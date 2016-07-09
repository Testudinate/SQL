Представлена модель оплат пользователем покупок. У каждого пользователя может быть несколько оплат, но каждая оплата принадлежит только одному пользователю. Какой код нужно добавить вместо [1] и [2], чтобы корректно связать отношения?

class Payment(models.Model):
    date = models.DateTimeField(default=datetime.now)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    [1]

class Person(models.Model):
    user = models.OneToOneField(User, null=True)
    delivery_adress = models.TextField(blank=True)
    [2]
    
    
    
     [1]: person = models.ForeignKey(Person) [2]: payment = models.ForeignKey(Payment)
 [1]: ничего [2]: payment = models.ForeignKey(Payment)
 [1]: person = models.ForeignKey(Person) [2]: payment = models.OneToOne(Payment)
 [1]: ничего [2]: ничего
 [1]: person = models.ForeignKey(User) [2]: ничего
 [1]: person = models.ForeignKey(Person) [2]: ничего   +
 [1]: ничего [2]: payment = models.ManyToManyField(Payment)
