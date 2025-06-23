from django.shortcuts import render
from django.views.generic import ListView, CreateView,UpdateView,DeleteView
from .models import Item
from django.urls import reverse_lazy
# Create your views here.

class ItemListView(ListView):
    model = Item
    template_name = 'items/item_list.html'
    context_object_name = 'items'
class ItemCreateView(CreateView):
    model = Item
    fields = ['name','description']
    template_name = 'items/item_form.html'
    success_url = reverse_lazy('item-list')
class ItemUpdateView(UpdateView):
    model = Item
    fields = ['name','description']
    template_name = 'items/item_form.html'
    success_url = reverse_lazy('item-list')
class ItemDeleteView(DeleteView):
    model = Item
    template_name = 'items/item_confirm_delete.html'
    success_url = reverse_lazy('item-list')


