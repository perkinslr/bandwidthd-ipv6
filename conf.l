%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "conf.tab.h"

%}

%%
[ \t]+            /* Ignore */;
\n            { return TOKNEWLINE; }
#.*\n              { return TOKNEWLINE; }
([0-9]{1,3}"."){3,3}([0-9]{1,3}) { bdconfig_lval.string=strdup(yytext); return IPADDR; }
[-0-9]+          { bdconfig_lval.number=atoi(yytext); return NUMBER; }
\".*\"          { bdconfig_lval.string=strdup(yytext); return STRING; }
\/            { return TOKSLASH; }
/^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$/ { return IP6ADDR; }
true|false              { bdconfig_lval.number=!strcmp(yytext,"true"); return STATE; }
subnet          { return TOKSUBNET; }
notsubnet         { return TOKNOTSUBNET; }
dev            { return TOKDEV; }
skip_intervals      { return TOKSKIPINTERVALS; }
graph_cutoff      { return TOKGRAPHCUTOFF; }
promiscuous        { return TOKPROMISC; }
output_cdf        { return TOKOUTPUTCDF; }    
recover_cdf        { return TOKRECOVERCDF; }    
graph          { return TOKGRAPH; }
filter          { return TOKFILTER; }
meta_refresh      { return TOKMETAREFRESH; }
pgsql_connect_string  { return TOKPGSQLCONNECTSTRING; }
sqlite_filename      { return TOKSQLITEFILENAME; }
sensor_id        { return TOKSENSORID; }
htdocs_dir        { return TOKHTDOCSDIR; }
log_dir          { return TOKLOGDIR; }
description        { return TOKDESCRIPTION; }
management_url      { return TOKMANAGEMENTURL; }
extensions        { return TOKEXTENSIONS; }
.            { return TOKJUNK; }
%%
