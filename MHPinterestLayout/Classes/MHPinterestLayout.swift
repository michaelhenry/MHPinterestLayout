
import UIKit

public protocol MHPinterestLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView,
                        heightForItemAtIndexPath indexPath:IndexPath) -> CGFloat
    
}

public class MHPinterestLayoutAttributes:UICollectionViewLayoutAttributes {

    var columnIndex:Int = 0
    
}

public class MHPinterestLayout:UICollectionViewLayout {
    
    public var delegate:MHPinterestLayoutDelegate!
    public var columns:Int = 2 {
        didSet {
            if columns != oldValue {
                invalidateLayout()
            }
        }
    }
    
    
    public var headerHeight:CGFloat = 200
    public var footerHeight:CGFloat = 0
    public var horizontalCellSpacing:CGFloat = 10.0
    public var verticalCellSpacing:CGFloat = 10.0
    
    private var cache = [MHPinterestLayoutAttributes]()
    private var contentHeight:CGFloat = 0
    private var width:CGFloat {
        get {
            return collectionView!.bounds.width
        }
    }
    
    public var cellContentWidth:CGFloat {
        return (width - (horizontalCellSpacing * CGFloat(columns + 1)))/CGFloat(columns)
    }
  
    override public var collectionViewContentSize: CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
    override public func prepare() {
        
        if !cache.isEmpty {
            return
        }

        var colHeights:[CGFloat] = [CGFloat](repeatElement(headerHeight, count: columns))
        
        let headerAttribute = MHPinterestLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                                               with: IndexPath(index: 0))
        headerAttribute.frame = CGRect(x: 0, y: 0, width: width, height: headerHeight)
        cache.append(headerAttribute)
        
        let numberOfItems = collectionView?.numberOfItems(inSection: 0) ?? 0
        for item in 0..<numberOfItems {
            
            let indexPath:IndexPath = IndexPath(item: item, section: 0)
            
            // Get the index of the shortest column and use that index as row index
            let deltaY:CGFloat = 5.0
            let columnIndex:Int = colHeights
                .enumerated()
                .sorted {
                    $0.element < ($1.element - deltaY)
                }.first?.offset ?? 0
            
            let height:CGFloat = self.delegate.collectionView(collectionView!,
                                                              heightForItemAtIndexPath: indexPath)
            
           
            
            // create a frame for the item
            let x =  CGFloat(columnIndex + 1) * horizontalCellSpacing + (cellContentWidth * CGFloat(columnIndex))
            let itemRect = CGRect(x:x,
                                  y: colHeights[columnIndex] + verticalCellSpacing,
                                  width: cellContentWidth,
                                  height: height)
            
            let attributes = MHPinterestLayoutAttributes(forCellWith: indexPath)
            attributes.frame = itemRect
            cache.append(attributes)
            
            // append the item.height to the currenct colHeight
            colHeights[columnIndex] = colHeights[columnIndex] + height + verticalCellSpacing
            
            // make the contentHeight equal to which ever has the max colHeight
            contentHeight = (colHeights
                .enumerated()
                .sorted {
                    $0.element > $1.element
                }.first?.element ?? 0) + verticalCellSpacing
        }
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.row]
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override public func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == UICollectionElementKindSectionHeader {
            let attribute = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
            attribute.frame = CGRect(x: 0, y: 0, width: (collectionView?.frame.width)!, height: headerHeight)
            return attribute
        } else if elementKind == UICollectionElementKindSectionFooter {
            let attribute = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
            attribute.frame = CGRect(x: 0, y: 0, width: (collectionView?.frame.width)!, height: footerHeight)
            return attribute
        }
        return UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return newBounds.size != collectionView?.bounds.size
    }

    public override func invalidateLayout() {
        cache.removeAll()
        super.invalidateLayout()
    }
}
