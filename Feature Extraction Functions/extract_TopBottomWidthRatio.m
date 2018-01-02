function ratio = extract_TopBottomWidthRatio(glyph)
%ratio = extractWidthAtTop(glyph)

topRatio = extract_WidthAtTop(glyph);
botRatio = extract_WidthAtBottom(glyph);

ratio = topRatio ./ botRatio;


end

