<%@ page import="java.util.*,model.*,control.*"%>
<!DOCTYPE html>
<html lang="it">
<%
Ordine ordine = OrdineDAO.getOrderByID(Integer.parseInt(request.getParameter("Order_ID")));
User user = UserDAO.getUserByID(ordine.getUser_ID());
ArrayList<String> prodotti = ordine.getProdottiAcquistati();
double totaleNetto = 0;
double totaleConIva = 0;
double prezzoCorrente = 0;
double totaleIva = 0;
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fattura</title>
<link rel="stylesheet" href="./CSS/fatturacss.css" type="text/css"
	media="all" />
<link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<div>
		<div class="py-4">
			<div class="px-14 py-6">
				<table class="w-full border-collapse border-spacing-0">
					<tbody>
						<tr>
							<td class="w-full align-top">
								<div>
									<img src="./IMG/logoblack.png" class="h-12" /> A L T A F R E Q
									U E N Z A
								</div>
							</td>

							<td class="align-top">
								<div class="text-sm">
									<table class="border-collapse border-spacing-0">
										<tbody>
											<tr>
												<td class="border-r pr-4">
													<div>
														<p class="whitespace-nowrap text-slate-400 text-right">Data</p>
														<p
															class="whitespace-nowrap font-bold text-main text-right"><%=ordine.getOrder_Data()%></p>
													</div>
												</td>
												<td class="pl-4">
													<div>
														<p class="whitespace-nowrap text-slate-400 text-right">Fattura
															#</p>
														<p
															class="whitespace-nowrap font-bold text-main text-right"><%=ordine.getOrder_ID()%></p>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="bg-slate-100 px-14 py-6 text-sm">
				<table class="w-full border-collapse border-spacing-0">
					<tbody>
						<tr>
							<td class="w-1/2 align-top">
								<div class="text-sm text-neutral-600">
									<p class="font-bold">Alta Frequenza S.P.A.</p>
									<p>Number: 4839201</p>
									<p>VAT: 5940394</p>
									<p>Via Giovanni Paolo II</p>
									<p>Fisciano, 80084</p>
									<p>Italia</p>
								</div>
							</td>
							<td class="w-1/2 align-top text-right">
								<div class="text-sm text-neutral-600">
									<p class="font-bold">Cliente</p>
									<p></p>
									<p><%=user.getCognome()%>
									</p>
									<p><%=user.getNome()%></p>
									<p><%=user.getCitta()%>(<%=user.getProvincia()%>),<%=user.getCAP()%></p>
									<p><%=user.getNazione()%></p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="px-14 py-10 text-sm text-neutral-700">
				<table class="w-full border-collapse border-spacing-0">
					<thead>
						<tr>
							<td class="border-b-2 border-main pb-3 pl-3 font-bold text-main">#</td>
							<td class="border-b-2 border-main pb-3 pl-2 font-bold text-main">Prodotto</td>
							<td
								class="border-b-2 border-main pb-3 pl-2 text-right font-bold text-main">Prezzo</td>
							<td
								class="border-b-2 border-main pb-3 pl-2 text-center font-bold text-main">IVA</td>
							<td
								class="border-b-2 border-main pb-3 pl-2 text-right font-bold text-main">Subtotale</td>
							<td
								class="border-b-2 border-main pb-3 pl-2 pr-3 text-right font-bold text-main">Subtotal
								+ IVA</td>
						</tr>
					</thead>
					<tbody>
						<%
						for (String pid : prodotti) {
							int i = 0;
							Prodotto p = ProdottoDAO.getProductByID(pid);
						%>
						<tr>
							<td class="border-b py-3 pl-3"><%=i++%></td>
							<td class="border-b py-3 pl-2"><%=p.getProduct_Name()%></td>
							<td class="border-b py-3 pl-2 text-right">€<%=p.getPrice()%></td>
							<td class="border-b py-3 pl-2 text-center"><%=p.getIVA()%>%</td>
							<td class="border-b py-3 pl-2 text-right"><%=p.getPrice()%></td>
							<%
							totaleNetto = +p.getPrice();
							%>
							<td class="border-b py-3 pl-2 pr-3 text-right"><%=(p.getPrice() + (p.getIVA() * p.getPrice()))%></td>
							<%
							prezzoCorrente = p.getPrice() + (p.getIVA() * p.getPrice());
							totaleIva += ((p.getIVA() * p.getPrice()));
							totaleConIva = +prezzoCorrente;
							%>
						</tr>
						<%
						}
						%>
						<tr>
							<td colspan="7">
								<table class="w-full border-collapse border-spacing-0">
									<tbody>
										<tr>
											<td class="w-full"></td>
											<td>
												<table class="w-full border-collapse border-spacing-0">
													<tbody>
														<tr>
															<td class="border-b p-3">
																<div class="whitespace-nowrap text-slate-400">Totale
																	netto:</div>
															</td>
															<td class="border-b p-3 text-right">
																<div class="whitespace-nowrap font-bold text-main">
																	€<%=totaleNetto%></div>
															</td>
														</tr>
														<tr>
															<td class="p-3">
																<div class="whitespace-nowrap text-slate-400">Totale
																	IVA:</div>
															</td>
															<td class="p-3 text-right">
																<div class="whitespace-nowrap font-bold text-main">
																	€<%=totaleIva%></div>
															</td>
														</tr>
														<tr>
															<td class="bg-main p-3">
																<div class="whitespace-nowrap font-bold text-white">Totale:</div>
															</td>
															<td class="bg-main p-3 text-right">
																<div class="whitespace-nowrap font-bold text-white">
																	€<%=totaleConIva%></div>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="px-14 text-sm text-neutral-700">
				<p class="text-main font-bold">DETTAGLI PAGAMENTO</p>
				<p>Intesa San Paolo</p>
				<p>Account numero: 78976</p>
				<p>
					Pagamento numero:
					<%=ordine.getOrder_ID()%></p>
			</div>

			<div class="px-14 py-10 text-sm text-neutral-700">
				<p class="text-main font-bold">Note</p>
				<p class="italic">Questa fattura è un documento che attesta
					l'avvenuto pagamento presso la società Alta Frequenza S.P.A. ed è
					valido come documento fiscale.</p>
			</div>

			<footer
				class="fixed bottom-0 left-0 bg-slate-100 w-full text-neutral-600 text-center text-xs py-3">
				Alta Frequenza S.P.A. <span class="text-slate-300 px-2">|</span>
				info@altafrequenza.it <span class="text-slate-300 px-2">|</span>
				+39-081-999-090
			</footer>
		</div>
	</div>
</body>

</html>
