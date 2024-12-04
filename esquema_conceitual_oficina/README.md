<H1>Esquema Conceitual</H1>
<H2>Oficina Mecânica</H2>

<p>Este é um esquema conceitual para ordens de serviço de uma oficina mecênica. As tabelas e seus atributos seguem uma formatação concisa, com o nome definindo sua função e os atributos com 3 primeiros caracteres no início, facilitando a administrção e a realização de consultas no banco. Todo registro possui a primeira coluna como chave primaria autoincremental assim como na maioria dos ERPs, com exceção das linha de ordem de serviço, possuindo uma chave primaria composta da junção entre a chave primaria da ordem de serviço e a linha do item/serviço a ser realizado (inspirado no modelo SAP).</p>

<p><li>Cada veículo pertence a uma OS.</li>
<li>Cada OS é designada a uma equipe.</li>
<li>Produtos são classificados como materiais (peças) ou serviços.<\li>
<li>Cada produto possui um valor.</li>
<li>Uma OS possui um ou vários produtos/serviços.</li>
<li>Uma equipe é composta por vários funcionários.</li>
<li>A partir da OS calcula-se o valor.</li></p>
