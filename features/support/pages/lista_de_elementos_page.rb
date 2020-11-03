class MapeandoLista < SitePrism::Page
    set_url 'buscaelementos/table'

    # elements :lista, 'tr > th' #pegando apenas a primeira linha da tabela
    elements :lista, 'tr > td'

end