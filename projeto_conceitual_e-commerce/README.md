<h1>Projeto Conceitual de Banco de Dados – E-COMMERCE</h1>

<p>Um projeto conceitual para um e-commerce, toda tabela possui um nome e suas colunas as 3 iniciais do nome para facilitar a manipulação.</p> 
<p>Um cliente pode se cadastrar com seu CPF ou CNPJ (armazenado em CLI_identificacao). O tipo pode ser pessoa física ou jurídica, determinando a identificação fiscal utilizada.</p>
<p>Pode ter cadastrado mais de uma forma de pagamento, ela contem a informação da entrada e a procentagem paga caso parcelado e quando as parcelas são cobradas.</p>
<p>Toda entrega possui um status (aberto, fechado ou cancelado), um código de rastreio e um endereço do cliente.</p>
<p>Um vendedor pode vender produtos na plataforma, assim como terceiros, logo para não haver uma tabela de fornecedor e de terceirs, ambos foram unificados na tabela de parceiro de negócios (inspirado nos ERPs como SAP B1) e o produto possui um fornecedor vinculado, cadastrado como PN.</p>
<p>Um cliente e um fornecedor podem ter múltiplos endereços, cliente pensando como endereço de entrega para presentes e forncedeor pensando em mútiplas sedes.</p>
<p>Parceiro de negócios possuem catalogo de produtos com sua quantidade em estoque.</p>
<p>Estoque se refere ao estoque da própria plataforma.</p>
