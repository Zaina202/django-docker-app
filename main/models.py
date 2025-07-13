from django.db import models

# Create your models here.
from django.db import models

class Book(models.Model):
    title = models.CharField(max_length=200)      # Book title
    author = models.CharField(max_length=100)     # Author name
    published_date = models.DateField()            # Date when the book was published
    isbn = models.CharField(max_length=13, unique=True)  # ISBN number, unique
    pages = models.IntegerField()                   # Number of pages
    cover = models.ImageField(upload_to='covers/', null=True, blank=True)  # Book cover image (optional)

    def __str__(self):
        return self.title
