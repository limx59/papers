// Copyright 2015, Barefoot Networks, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

action set_src_vtep_miss_flag() {
    modify_field(ingress_metadata.src_vtep_miss, TRUE);
}

action set_tunnel_lif(lif) {
    modify_field(ingress_metadata.tunnel_lif, lif);
}

table ipv4_src_vtep {
    reads {
        ingress_metadata.vrf : exact;
        ingress_metadata.lkp_ipv4_sa : exact;
    }
    actions {
        nop;
        set_tunnel_lif;
        set_src_vtep_miss_flag;
    }
    size : SRC_TUNNEL_TABLE_SIZE;
}
