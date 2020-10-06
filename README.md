# AppManutencao

Projeto destinado à avaliação de contratação para equipe de Sustentação - Softplan. Siga as instruções descritas aqui para corrigir o projeto e entregar as correções para o avaliador.

Versão utilizada do Delphi: Tokyo 10.2. Pode ser utilizada outras versões, desde que o código seja compatível. Testamos com o Community 10.3 e funcionou também.

## Instruções

### Correções a serem realizadas

- Resolva todos defeitos descritos na seção `Defeitos`. Obrigatório.
- **Todos** os `hints` e `warnings` do projeto devem ser resolvidos. Não esqueça de sempre rodar o build (Shift + F9), ao invés do compile (Ctrl + F9), para ver todos os hints e warnings. Obrigatório.
- **Todos** os `memory leaks` do projeto devem ser resolvidos. Obrigatório.
- Fica aberto ao candidato se quiser refatorar algo no projeto. Opcional.

### Como submeter uma correção 

 - Corrija o projeto e nos envie por e-mail ou faça upload para núvem e nos envie o link. 
 - Envie o projeto limpo, apenas com os mesmos arquivos enviados (sem dcu, binário, etc).

## Defeitos

Corrija cada defeito descrito abaixo. Cada seção corresponde à uma tela do projeto. Para cada defeito, preencher causa e solução: 

* Causa: explicar tecnicamente qual era a causa do problema; 
* Solução: explicar tecnicamente qual foi a solução dada ao problema; 

### Dataset Copy 

`Defeito 1: fazer as alterações do Dataset 1 serem replicadas automaticamente no Dataset 2`

Causa: Não existe nenhum controle para saber quando quando replicar as alterações do dataSet1 no dataSet2.

Solução: Foi criado uma procedure chamada CopiarClientDataSet e adicionada no evento OnStateChange do DataSet1.

### Dataset Loop

`Defeito 2: corrigir rotina que apaga números pares`

Causa: A rotina está sempre realizando um next, mesmo quando faz o delete, no entanto quando é realizado um delete, 
o ClientDataSet já se posiciona automáticamente no registro posterior ao delete não sendo necessário realizar um Next, 
pois se deletar e der um next, o sistema irá se posicionar no próximo registro, quando der o next irá para o próximo novamente, 
fazendo com que o primeiro registro posicionado não seja verificado.

Solução: Fazer um if else, ou seja acrescentar um else no código fazendo com que o ClientDataSet.Next só seja executado caso o resultado do if seja falso.

### Streams

`Defeito 3: erro de Out of Memory ao clicar no botão "Load 100"`

Causa: A cada passada do for a variável S recebe o LoadStream e ela deveria receber apenas uma vez o LoadStram, pois a cada passada do for vai ficar sendo carregado na memória o arquivo pdf.pdf

Solução: Inicializar a variável S antes do for.

`Defeito 4: quando clica várias vezes seguidas no botão Load 100 (mais de 10 vezes), ao tentar fechar o sistema ele não fecha`

Causa: 

Solução: O problema não foi identificado, fiz alguns testes, mas o problema não aconteceu comigo...

### Exceptions/Performance

`Defeito 5: melhorar performance do processamento quando utilizado o botão "Operação em lote". Esperado que a operação seja concluída em menos de 10s. (Manter a ordem original do texto é um plus)`

Causa: A rotina está usando o TStringList para abrir o arquivo

Solução: Usar o TextFile para abrir o arquivo e na hora de ler o caracter usar o "For in" ;

`Defeito 6: ao clicar no botão "Operação 1" está escondendo a exceção original. Alterar para mostrar a exceção correta no Memo1`

Causa: A rotina nao está "olhando" para o Memo1, está apenas mostrando uma mensagem de erro na tela.

Solução: Alterada a rotina para adicionar a mensagem de erro na linha do Memo1, Memo1.lines.add(e.message);

`Defeito 7: ao clicar em "Operação em lote" não deve parar o processamento caso dê erros na rotina. Caso apresente erros, suas classes (ClassName da exceção) e mensagens (Message da exceção) devem ser mostrados no fim do processamento, no Memo1. Exemplo: é feito um laço de 0 à 7. Caso dê erro quando i for igual a 1, deve continuar o processamento para o 2, e assim por diante.`

Causa: Quando a rotina está sendo executada e dá erro, a excessão é simplesmente criada.

Solução: Armazenar a Mensagem da excessão no Memo1 desta forma a rotina irá continuar.

`Defeito 8: substitua o "GetTickCount" por outra forma de "contar" o tempo de processamento`

Causa: 

Solução: O Delphi possui uma classe preparada para a medida do tempo, TStopWatch.

### Threads

`Defeito 9: crie um formulário com o nome da unit “Threads.pas” e nome do form “fThreads” e 
altere o form Main para abrir este novo form, como é feito nos outros botões. 
Neste form deve haver um botão que executará duas threads (aqui se entende thread, task, thread anônima, 
qualquer tipo de programação paralela). Estas threads irão realizar um laço de 0 até 100, 
onde a cada iteração do laço elas deverão aguardar (sleep) um tempo em milisegundos determinado pelo usuário 
(pode ser configurado em um TEdit). A cada iteração do laço, a thread deverá incrementar uma barra de progresso, 
com valor Max 200 (100 de cada thread). A mesma barra de progresso deve ser usada em ambas threads`

Causa: 

Solução: Foi criado uma procedure para carregar o ProgressBar com o nome CarregarProgressBar, e para funcionar a Thread foi usado um array of ITask, 
