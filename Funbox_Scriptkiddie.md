<p>We start with finding the correct machine on the network to attack.</p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox1.PNG?t=1638348289504" style="max-width:830px;width:100%;max-height:30px;" /></p>

<p>This is then followed by nmap to enumerate the ports and services running on there and start planning how to attack the machine.</p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox2.PNG?t=1638348446908" style="max-width:1207px;width:100%;max-height:1255px;" /></p>

<p>The FTP version that is open is one that I hadn&#39;t seen before so it caught my attention.&nbsp;</p>

<p>I googled it and there&#39;s an exploit available!</p>

<p><a href="https://www.rapid7.com/db/modules/exploit/unix/ftp/proftpd_133c_backdoor/" rel="nofollow" target="_blank">https://www.rapid7.com/db/modules/exploit/unix/ftp/proftpd_133c_backdoor/</a></p>

<p><a href="https://www.exploit-db.com/exploits/16921" rel="nofollow" target="_blank">https://www.exploit-db.com/exploits/16921</a></p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox4.PNG?t=1638348700533" style="max-width:1369px;width:100%;max-height:462px;" /></p>

<p>We use exploit &quot;4&quot; which matches the version number exactly and should get us into the target machine.</p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox5.PNG?t=1638348823009" style="max-width:1375px;width:100%;max-height:481px;" /></p>

<p>The default port is already correct, we just need to set the RHOSTS&nbsp;</p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox6.PNG?t=1638348922966" style="max-width:970px;width:100%;max-height:64px;" /></p>

<p>Set the payload and LHOSTS</p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox7.PNG?t=1638349356246" style="max-width:1375px;width:100%;max-height:1304px;" /></p>

<p>And... I&#39;m in!</p>

<p><img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox8.PNG?t=1638349419326" style="max-width:1235px;width:100%;max-height:401px;" /></p>

<p>And the flag is easy to find in the root directory<img alt="" class="img-responsive" data-citation-link="" data-citation-text="" data-long-description="" src="https://www.openlearning.com/u/omarelgammal-r1iynb/blog/media/Funbox10.PNG?t=1638349555063" style="max-width:1233px;width:100%;max-height:938px;" />.</p>

<p>&nbsp;</p>
