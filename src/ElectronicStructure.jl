"""
    module ElectronicStructure

Provides an interface to electronic structure calculation packages.  The only
package supported is `pyscf`.

Note that doc strings for Python objects are available at the Julia REPL. For example

    help?> ElectronicStructure.pyscf.gto.Mole
"""
module ElectronicStructure

import PeriodicTable
import Requires
import ZChop
using Tullio: @tullio

export Atom, Geometry, MolecularSpec, InteractionOperator, InteractionOperator!
export non_zero_elements, non_zero_elements_python, phys_to_chem, chem_to_phys,
    test_hijkl_symmetries
export to_openfermion

function __init__()
    Requires.@require PyCall="438e738f-606a-5dbb-bf0a-cddfbfd45ab0" begin
        include("pyscf.jl")
    end
end

include("utils.jl")
include("molecular_spec.jl")
include("molecular_data.jl")
include("interaction_operator.jl")
include("openfermion.jl")

end # module ElectronicStructure
