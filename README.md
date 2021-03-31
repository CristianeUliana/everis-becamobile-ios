# Avaliação Beca Mobile iOS

Criar um aplicativo que realize a listagem de filmes e exibição dos detalhes:
 * Tela principal, lista de filmes:
    - Listar capa dos filmes que são tendências da semana. 
 * Tela de detalhes do filme:  
    - Quando o usuário selecionar um filme, o aplicativo deve direciona-lo para uma segunda tela e exibir o título, capa, rating e sinopse. 
 * Cubra seu projeto com testes unitários.
  
* API para consumo: 
  - A listagem de filmes deve ser consultada na API https://developers.themoviedb.org/3/getting-started/introduction 
    Ao se cadastrar você receberá uma chave de acesso, que deverá ser usada nas requisições. 
  - Requisição para listar as tendências https://developers.themoviedb.org/3/trending/get-trending
    - Ex.: https://api.themoviedb.org/3/trending/all/week?api_key=00000&language=pt-BR
  - Requisição para listar os detalhes https://developers.themoviedb.org/3/movies/get-movie-details
    - Ex.: https://api.themoviedb.org/3/movie/454626?api_key=00000&language=pt-BR
  
* Ao iniciar a avaliação:
  - Faça um fork deste projeto
  - Fazer o cadastro no site para consumir a API
  
* Mandando bem na avaliação:
  - Realize quantos commits puder, não queremos somente a solução final; queremos saber como você chegou lá. Sua evolução vale tanto quanto o resultado final.
  - Arquitetura MVC, busque organizar o código, separando as chamadadas de API e usando extensions.
  - O Design é livre, mas se tiver um tempinho... gostariamos que fizesse uma revisão final, usando as dicas da Apple:
  https://developer.apple.com/design/tips/
  - Sugestões de bibliotecas:
     - Carregamento de imagens 
       - https://github.com/Alamofire/AlamofireImage
     - Requisições:
       - Opção 1) http https://github.com/Alamofire/Alamofire
       - Opção 2) https://github.com/Moya/Moya

* Ao finalizar a avaliação:
   - Quando finalizar a implementação faça um pull request; na descrição informe qual a abordagem que você utilizou para chegar na solução, descreva também quais foram os maiores desafios para concluir a avaliação.

* Plus:
   - Se tiver um tempinho, você poderá fazer algumas melhorias, como:
       -  Refactory no código
       -  Paginação de filmes
       -  Filtro no SearchBar
       
* Opcional: Se for usar o clone via SSH, segue ajuda do GitHub:
  - https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  - Se for usar o ssh para clone, este comando ajuda a salvar a chave de forma local: 
    - ssh-add -K ~/.ssh/id_rsa

* :clap: Parabéns por ter chegado até aqui! :smile: _Um grande abraço e bem vindo ao time Mobile iOS_ :iphone: :punch:



#######################################################################################

RESULTADO DA AVALIAÇÃO:

O aplicativo foi desenvolvido utilizando a versão 10.1 do xCode, com base no simulador do iPhone SE.

As requisições foram feitas utilizando Alamofire, com codificação nativa. As informações necessárias para a primeira tela são populadas em atributos da classe Filme.

Para chamar as imagens da capa dos filmes da semana foi utilizado o AlamofireImage. As imagens estão dispostas na tela utilizando uma CollectionView

Foi implementada na primeira tela uma SearchBar para pesquisa com base nos títulos dos filmes em português.

Ao clicar em um filme, o usuário é direcionado para a segunda tela, na qual ocorre a requisição dos Detalhes do filme. Para essa requisição foi utilizado o id do filme clicado. As informações necessárias são populadas em atributos da classe Detalhes, que, por sua vez, é um atributo da classe Filme. Dessa forma, todas as informações referentes ao filme pertencem ao mesmo objeto, criado na primeira requisição.

Na tela de detalhes foi implementada uma ScrollView, visto que a sinopse de alguns filmes pode ser grande demais para a tela do iPhone SE.

Para que o aplicativo possua responsividade nos demais iPhones, foram implementadas constraints e stackViews, dessa forma o conteúdo está se ajustando a outros modelos. 

Por fim, foram implementados dois testes unitários para verificar se a requisição está ignorando filmes que estejam sem informações no servidor, salvando os próximos sem problemas.


MAIORES DESAFIOS:

1- O primeiro desafio que encontrei foi a utilização do codable no código. Após utilizar o QuickType para gerar o codable, o xCode não reconhecia como uma estrutura que pudesse ser codificada. Dessa forma, optei por não utilizar codable nesse primeiro momento. 
Apenas após finalizar o aplicativo, descobri que precisava desmarcar uma opção no QuickType para que o codable fosse gerado de forma correta. Assim, pretendo refatorar o código utilizando codable em outra branch.

2 - Fazer a primeira requisição foi desafiador. Compreender o json que chegava com as informações e como era estruturado foi imprescindível para o andamento desta etapa.

3 - Carregar a imagem na primeira tela foi outro desafio, pois a CollectionView carregava antes de a requisição finalizar. Para esta etapa foi preciso entender melhor o conceito de completion e lembrar de fazer a atualização da tabela após a requisição finalizar.

4 - Trabalhar com layout também se mostrou bastante desafiador. As constraints, a stack e o scroll foram bem trabalhosos de implementar.

5 - Por fim, encontrei um pouco de dificuldade na hora de formular os cenários de teste para essa aplicação.


PRÓXIMOS PASSOS:

1 - Implementar a codificação por codable.

2 - Verificar a demora do carregamento das informações da página de detalhes. Pretendo encontrar uma maneira de fazer com que as labels sejam apresentadas apenas com as informações da requisição. Da forma como está agora, quando a requisição demora a retornar as informações, a tela é mostrada com as labels genéricas.

3 - Verificar o layout das imagens e informações nos demais modelos de iPhone, pois parecem estar sofrendo um pouco de distorção nos tamanhos maiores.

4 - Implementar a paginação.

