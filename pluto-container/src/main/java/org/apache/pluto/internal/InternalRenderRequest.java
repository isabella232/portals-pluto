package org.apache.pluto.internal;

/**
 * The internal render request interface extends the internal portlet request
 * interface and provides some render-specific methods.
 * @author <a href="mailto:zheng@apache.org">ZHENG Zhong</a>
 * @since 2006-02-17
 */
public interface InternalRenderRequest extends InternalPortletRequest {
	
    public void setIncluded(boolean included);
    
    public boolean isIncluded();
    
    public void setIncludedQueryString(String queryString);
    
}