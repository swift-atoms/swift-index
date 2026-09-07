import Ordinal
import Tagged
import Testing

@testable import Index

private enum Bit {}
private enum Byte {}

@Suite
struct `Indices preserve ordinal positions and their domains` {
    @Suite struct `Index construction preserves the supplied ordinal position` {}
    @Suite struct `Indices preserve the largest ordinal position` {}
    @Suite struct `No additional index integration cases are defined` {}
}

extension `Indices preserve ordinal positions and their domains`.`Index construction preserves the supplied ordinal position` {
    @Test
    func `Index construction preserves a positive position`() {
        let index: Index::Index<Int> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(UInt(5))
        )

        #expect(index.underlying.rawValue == 5)
    }

    @Test
    func `Index construction preserves a zero position`() {
        let index: Index::Index<String> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(UInt.zero)
        )

        #expect(index.underlying.rawValue == 0)
    }

    @Test
    func `unchecked init bypasses validation`() {
        let index: Index::Index<Int> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(42)
        )

        #expect(index.underlying.rawValue == 42)
    }

    @Test
    func `underlying value is ordinal`() {
        let index: Index::Index<Int> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(UInt(10))
        )

        #expect(index.underlying.rawValue == 10)
    }

    @Test
    func `Distinct index domains can preserve the same ordinal position`() {
        let bitIndex: Index::Index<Bit> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(UInt(5))
        )
        let byteIndex: Index::Index<Byte> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(UInt(5))
        )

        #expect(bitIndex.underlying.rawValue == byteIndex.underlying.rawValue)

    }
}

extension `Indices preserve ordinal positions and their domains`.`Indices preserve the largest ordinal position` {
    @Test
    func `maximum ordinal value is preserved`() {
        let index: Index::Index<Int> = Tagged::Tagged(
            _unchecked: Ordinal::Ordinal(UInt.max)
        )
        #expect(index.underlying.rawValue == UInt.max)
    }
}
